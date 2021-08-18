#include <iostream>
#include <string>
#include <unordered_map>
#include <sys/sysinfo.h>

#include "../include/processor.h"
#include "../include/minico_api.h"
#include "../include/socket.h"
#include "../include/mutex.h"

#include "../include/logger.h"

#include "../include/rpc/rpc_server.h"
#include "../include/rpc/rpc_client.h"

using namespace minico;

/** 注册的一种Service*/
class HelloWorld : public Service
{
  public:
	typedef void (HelloWorld::*Func)(TinyJson& request,TinyJson& result);

	HelloWorld() : _name("HelloWorld")
	{
		_methods["hello"] = &HelloWorld::hello;
		_methods["world"] = &HelloWorld::world;
	}
	virtual const char* name() const
	{
		return _name.c_str();
	}
	virtual ~HelloWorld() {}

	/** 实际的服务类的处理函数*/
	virtual void process(TinyJson& request,TinyJson& result) override
	{
		std::string method = request.Get<std::string>("method");
		LOG_INFO("the request method is %s",method.c_str());
		if(method.empty())
		{
			result["err"].Set(400);
			result["errmsg"].Set("request has no method");
			return;
		}
		auto it = _methods.find(method);
		if(it == _methods.end())
		{
			result["err"].Set(404);
			result["errmsg"].Set("method not found");
			return;
		}
		/** 找到服务的对应接口 那么执行即可*/
		(this->*(it->second))(request,result);
	}
	/** 需要用户重载的实际逻辑部分*/
	virtual void hello(TinyJson& request,TinyJson& result) = 0;
	virtual void world(TinyJson& request,TinyJson& result) = 0;
  private:
	std::unordered_map<std::string,Func> _methods;
	std::string _name;
};

class HelloWorldImpl : public HelloWorld
{
  public:
	HelloWorldImpl() = default;
	virtual ~HelloWorldImpl() = default;
	
	virtual void hello(TinyJson& request,TinyJson& result)
	{
		result["method"].Set("hello");
		result["err"].Set(200);
		result["errmsg"].Set("the loop problem is solved");
	}
	virtual void world(TinyJson& request,TinyJson& result)
	{
		result["method"].Set("world");
		result["err"].Set(200);
		result["errmsg"].Set("ok");
	}
};


void tcp_client_test()
{
	minico::co_go([](){
		TcpClient client;
		client.connect("127.0.0.1",12345);
		char buf[1024];

		LOG_INFO("client send ping");
		client.send("ping",4);
		client.recv(buf,1024);
		LOG_INFO("client recv %s",buf);
		/** 问题初步分析是由于rpc客户端销毁造成一直发送0造成的*/
	});
}

/** rpc send test result : success*/
void rpc_client_test()
{
	minico::co_go([](){
		RpcClient client;
		client.connect("127.0.0.1",12345);
		client.ping();
		TinyJson request;
		TinyJson result;
		request["service"].Set<std::string>("HelloWorld");
		request["method"].Set<std::string>("hello");
		client.call(request,result);
		int errcode = result.Get<int>("err");
		std::string errmsg = result.Get<std::string>("errmsg");
		LOG_INFO("--------------------------------");
		LOG_INFO("the result errcode is %d",errcode);
    	LOG_INFO("the result errmsg is %s",errmsg.c_str());
		LOG_INFO("--------------------------------");
	});
}

int main()
{
    LOG_INFO("start the test");

	/** test the tcp client and server  result : success*/
	// TcpServer s;
	// s.start(nullptr,12345);
	// tcp_client_test();

	/** test the rpc client and server*/
	RpcServer rpc_server;
	rpc_server.add_service(new HelloWorldImpl);
	rpc_server.start(nullptr,12345);
	rpc_client_test();

	RpcClient client_test;
	minico::co_go([&client_test](){
		client_test.connect("127.0.0.1",12345);
		client_test.ping();
		TinyJson request;
		TinyJson result;
		request["service"].Set<std::string>("HelloWorld");
		request["method"].Set<std::string>("world");
		client_test.call(request,result);
		int errcode = result.Get<int>("err");
		std::string errmsg = result.Get<std::string>("errmsg");
		LOG_INFO("--------------------------------");
		LOG_INFO("the result errcode is %d",errcode);
    	LOG_INFO("the result errmsg is %s",errmsg.c_str());
		LOG_INFO("--------------------------------");
	});

	minico::sche_join();
	std::cout << "end" << std::endl;
	return 0;
}

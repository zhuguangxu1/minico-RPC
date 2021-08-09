#pragma once

#include "../include/tcp_server.h"
#include "../include/json.h"

/** Service是一个接口,表示一种服务,一个RpcServer可以包含多个Service*/
class Service
{
  public:
    Service() = default;
    virtual ~Service() = default;

    virtual const char* name() const  = 0;

    /** 实际进行服务数据处理的功能函数*/
    virtual void process(const TinyJson& request,TinyJson& result) = 0;
};

/**
 * @brief 基于协程的rpc服务器
*/
class RpcServer
{
  public:
    DISALLOW_COPY_MOVE_AND_ASSIGN(RpcServer);

    RpcServer();
    ~RpcServer();

    /** 
     * 向服务器中添加一种服务,一种服务可以有多个接口方法
     * s必须是new创建的，方便统一管理
     */
    void add_service(Service* s);

    /**
     * 开启rpc服务器的运行
    */
    void start(const char* ip,int port);

  private:
    /** 先保存一个空指针 保存一个tcp的服务器也可以*/
    void* _p;
};

/**
 * rpc客户端，其功能必须要在一个协程中运行
*/
class RpcClient
{
  public:
    Client(const char* ip,int port);
    Client(const Client& c);
    ~Client();

    void operator=(const Client& c) = delete;

    /**
     * @brief 进行一次rpc请求，从result形参中直接得到结果
    */
    void call(const TinyJson& result,TinyJson& result);

    /** 客户端心跳检测*/
    void ping();

    void close();
  
  private:
    void* _p;
};
#include "../include/context.h"
#include "../include/parameter.h"
#include <stdlib.h>

using namespace minico;

Context::Context(size_t stackSize)
	:pStack_(nullptr), stackSize_(stackSize)
{ }

Context::~Context()
{
	if (pStack_)
	{
		free(pStack_);
	}
}

//将上下文context结构与函数以及Processor链接起来
//函数的作用：指定对应的工作函数、处理器以及封装的上下文类,进行运行封装
void Context::makeContext(void (*func)(), Processor* pP, Context* pLink)
{
	if (nullptr == pStack_)
	{
		pStack_ = malloc(stackSize_);
	}
	///@获取当前的寄存器信息等并保存到ctx结构体中
	::getcontext(&ctx_);
	ctx_.uc_stack.ss_sp = pStack_;                          //设置栈顶指针
	ctx_.uc_stack.ss_size = parameter::coroutineStackSize;  //设置栈大小 这里是不是应该改为stackSize_?
	ctx_.uc_link = pLink->getUCtx();                        //设置下一要执行的上下文链接
	makecontext(&ctx_, func, 1, pP);                        //boost::makecontext调用
	//参数的个数为1 参数为Processor* func是ctx上下文结构体的入口函数
}

//获取当前的上下文环境到自身保存的ucontext_t结构体中
void Context::makeCurContext()
{
	::getcontext(&ctx_);
}
//保存当前的上下文环境到参数pOldCtx中,同时将运行上下文切换到调用该函数的Context中
void Context::swapToMe(Context* pOldCtx)
{
	if (nullptr == pOldCtx)
	{
		setcontext(&ctx_);      //如果为空 就利用当前ctx结构体的存储信息刷新寄存器
	}
	//否则，就保存当前的上下文环境到pOldCtx的ctx结构体中，并将当前调用该swapToMe函数的Context类的
	//ctx结构体保存的上下文环境切入CPU并执行
	else                        
		swapcontext(pOldCtx->getUCtx(), &ctx_);
}

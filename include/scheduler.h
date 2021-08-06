#pragma once
#include <vector>
#include <functional>

#include "processor.h"
#include "processor_selector.h"
/**
 * @brief ���û�ָ��Э��������ĳ��Processor�ϣ����û�û��ָ��������ѡЭ���������ٵ�Processor�ӹ��µ�Э��
 */
namespace minico
{

	class Scheduler
	{
	protected:
		Scheduler();
		~Scheduler();

	public:

		DISALLOW_COPY_MOVE_AND_ASSIGN(Scheduler);

		static Scheduler* getScheduler();

		//��idx���̴߳�����Э��
		void createNewCo(std::function<void()>&& func, size_t stackSize);
		void createNewCo(std::function<void()>& func, size_t stackSize);

		Processor* getProcessor(int);

		int getProCnt();

		void join();

	private:
		//��ʼ��Scheduler��threadCntΪ���������߳�
		bool startScheduler(int threadCnt);

		//Э�̹�����ʵ��
		static Scheduler* pScher_;

		//���ڱ���������Ϊ�˷�����ִ��Ч�ʣ�ԭ���ϲ���������ռ�д���
		static std::mutex scherMtx_;
		//���е��̶߳���
		std::vector<Processor*> processors_;
		//Э�̷ַ���
		ProcessorSelector proSelector_;
	};

}
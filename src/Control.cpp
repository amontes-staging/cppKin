#include "Control.h"
#include "core/Environment.h"
#include "core/Logger.h"
#include "ConfigParams.h"
#include "TransportManager.h"

using namespace core;

namespace cppkin
{
    void Init(const GeneralParams& params){
        Environment::Instance().Init();
        Logger::Instance().Start(TraceSeverity::Info);
        ConfigParams::Instance().Load(params);
    }

    void Stop()
    {
        TransportManager::Instance().Stop();
        Logger::Instance().Terminate();
    }
}


#ifndef __HL_HAPI_UTIL_H_
#define __HL_HAPI_UTIL_H_
#include <hl.h>
#include <HAPI/HAPI.h>

namespace Houdini {
vdynamic *GetLastCallError(HAPI_Session* session = nullptr);
vdynamic *GetLastCookError(HAPI_Session* session = nullptr);
vdynamic *GetLastError(HAPI_Session* session, HAPI_StatusType statusType);

}

#endif
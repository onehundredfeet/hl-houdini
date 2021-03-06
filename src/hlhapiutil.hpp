
#ifndef __HL_HAPI_UTIL_H_
#define __HL_HAPI_UTIL_H_
#include <hl.h>
#include <HAPI/HAPI.h>

namespace Houdini {
vdynamic *GetLastCallError(HAPI_Result code, HAPI_Session* session = nullptr);
vdynamic *GetLastCookError(HAPI_Result code,HAPI_Session* session = nullptr);
vdynamic *GetLastError(HAPI_Result code,HAPI_Session* session, HAPI_StatusType statusType);
vstring *getString( HAPI_Session* session, HAPI_StringHandle str);
int setString( HAPI_Session* session, char *str);
varray *getChildNodeList(HAPI_Session* session, int nodeID, int typeFlags, int flagFlags, bool recursive);

}

#endif
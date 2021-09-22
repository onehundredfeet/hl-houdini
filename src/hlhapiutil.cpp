#include "hlhapiutil.hpp"
#include "hl_string_helpers.h"

namespace Houdini {

// 

vdynamic *GetLastError(HAPI_Result code, HAPI_Session* session, HAPI_StatusType statusType)
{
   

    int buffer_length = 0;
    auto x = HAPI_GetStatusStringBufLength(nullptr, statusType, HAPI_STATUSVERBOSITY_ERRORS, &buffer_length ) ;

    fprintf(stderr, "Hapi result codes %d | %d", code, x );

    if (x == HAPI_RESULT_SUCCESS) {
        char * buf = new char[ buffer_length ];
        if (HAPI_GetStatusString( session, statusType, buf, buffer_length ) == HAPI_RESULT_SUCCESS) {
            uchar * ubuf = new uchar[ buffer_length ];
            hl_from_utf8( ubuf, buffer_length, buf );
            delete[] buf;

            vdynamic *x = hl_alloc_strbytes(ubuf);

            delete [] ubuf;
            
            return x;
        }
       delete[] buf;
    }

    return hl_alloc_strbytes(USTR("No error found"));
}



vdynamic *GetLastCallError(HAPI_Result code,HAPI_Session* session) {
    return GetLastError( code, session, HAPI_STATUS_CALL_RESULT );
}

vdynamic *GetLastCookError(HAPI_Result code,HAPI_Session* session) {
    return GetLastError( code, session, HAPI_STATUS_COOK_RESULT );
}


vstring *getString( HAPI_Session* session, HAPI_StringHandle str) {
    int buffer_length = 0;
    auto x = HAPI_GetStringBufLength( session, str, &buffer_length );
    if (x == HAPI_RESULT_SUCCESS) {
        char * buf = new char[ buffer_length ];
        if (HAPI_GetString	(	session, str, buf, buffer_length) == HAPI_RESULT_SUCCESS) {
            auto *vstr = hl_utf8_to_hlstr( buf );
            return vstr;
        }
    }

    return nullptr;
}
int setString( HAPI_Session* session, char *str) {
    HAPI_StringHandle handle = 0;

    if (HAPI_SetCustomString	(	session, str, &handle) != HAPI_RESULT_SUCCESS) {
        
    }

    return handle;
}

varray *getChildNodeList(HAPI_Session* session, int nodeID, int typeFlags, int flagFlags, bool recursive) {
    int count;
    auto reta = HAPI_ComposeChildNodeList( session, nodeID,  typeFlags, flagFlags, recursive, &count );

    auto a = hl_alloc_array(&hlt_i32, count);

    auto p = hl_aptr(a, int);

    auto retb = HAPI_GetComposedChildNodeList(session, nodeID, p, count);
    return a;
}
}
#include "hlhapiutil.hpp"
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


}
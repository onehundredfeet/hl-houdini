#include "hlhapiutil.hpp"
namespace Houdini {
vdynamic *GetLastError(HAPI_Session* session)
{
    int buffer_length = 0;
    if (HAPI_GetStatusStringBufLength(nullptr, HAPI_STATUS_CALL_RESULT, HAPI_STATUSVERBOSITY_ERRORS, &buffer_length ) == HAPI_RESULT_SUCCESS) {
        char * buf = new char[ buffer_length ];
        if (HAPI_GetStatusString( session, HAPI_STATUS_CALL_RESULT, buf, buffer_length ) == HAPI_RESULT_SUCCESS) {
            uchar * ubuf = new uchar[ buffer_length ];
            hl_from_utf8( ubuf, buffer_length, buf );
            delete[] buf;

            vdynamic *x = hl_alloc_strbytes(ubuf);

            delete [] ubuf;
            
            return x;
        }
       delete[] buf;
    }

    return nullptr;
}
}
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Thread::IID		PACKAGE = Thread::IID		

UV
interpreter_id()
   PROTOTYPE: 
   CODE:
      RETVAL = ((UV)PERL_GET_THX)>>11;

   OUTPUT:
      RETVAL
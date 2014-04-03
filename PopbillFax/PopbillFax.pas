(*
*=================================================================================
* Unit for base module for Popbill Messaging API SDK. Main functionality is to
* send Short Messaging To Cell phones. Also LMS and MMS.
*
* This module uses synapse library.( http://www.ararat.cz/synapse/doku.php/ )
* It's full open source library, free to use include commercial application.
* If you wish to donate that, visit their site.
* So, before using this module, you need to install synapse by user self.
* You can refer their site or detailed infomation about installation is available
* from below our site. We appreciate your visiting.
*
* For strongly secured communications, this module uses SSL/TLS with OpenSSL.
* So You need two dlls (libeay32.dll and ssleay32.dll) from OpenSSL. You can
* get it from Fulgan. ( http://indy.fulgan.com/SSL/ ) We recommend i386_win32 version.
* And also, dlls must be released with your executions. That's the drawback of this
* module, but we acommplished higher security level against that.
*
* http://www.popbill.com
* Author : Kim Seongjun (pallet027@gmail.com)
* Written : 2014-04-01

* Thanks for your interest. 
*=================================================================================
*)
unit PopbillFax;

interface
uses
        TypInfo,SysUtils,Classes,
        Popbill,
        Linkhub;
type

        

        TFaxService = class(TPopbillBaseService)
        public
                constructor Create(PartnerID : String; SecretKey : String);

                //회원별 전송 단가 확인.
                function GetUnitCost(CorpNum : String) : Single;

        end;
implementation
constructor TFaxService.Create(PartnerID : String; SecretKey : String);
begin
       inherited Create(PartnerID,SecretKey);
       AddScope('160');
end;

function TFaxService.GetUnitCost(CorpNum : String) : Single;
var
        responseJson : string;
begin
        responseJson := httpget('/FAX/UnitCost',CorpNum,'');

        result := strToFloat(getJSonString( responseJson,'unitCost'));

end;

//End of Unit;
end.

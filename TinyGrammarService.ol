include "console.iol"
include "json_utils.iol"
include "exec.iol"
include "TinyGrammarInterfaces.iol"

execution { concurrent }

outputPort GoogleTranslate {
Location: "socket://translate.googleapis.com:443/translate_a/single"
Protocol: https {
  .osc.translate.alias = "?client=gtx&sl=it&tl=%{tolang}&dt=t&q=%{q}";
  .osc.translate.method = "get"
}
RequestResponse: translate
}

inputPort TinyGrammarService {
    Location: "socket://localhost:8080"
    Protocol: http
    Interfaces: TinyGrammarInterface
}

main
{
    translate( request )( response ){
      tinyRequest = "dotnet.exe ./TinyGrammar/NetCore/MB.TinyGrammar.NetCoreConsoleApp.dll ./TinyGrammar/tecnicheseGrammarExample.txt";
      tinyRequest.stdOutConsoleEnable = false;

      exec@Exec( tinyRequest )( tecnichese );
      translate@GoogleTranslate( { .q = tecnichese, .tolang = request.language } )( resp_gtran );
      response.sentence = tecnichese;
      for( line in resp_gtran._._ ) {
        response.translated += line._
      }
    }
}

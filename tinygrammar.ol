include "console.iol"
include "json_utils.iol"
include "exec.iol"

outputPort GoogleTranslate {
Location: "socket://translate.googleapis.com:443/translate_a/single"
Protocol: https {
  .osc.translate.alias = "?client=gtx&sl=it&tl=%{tolang}&dt=t&q=%{q}";
  .osc.translate.method = "get"
}
RequestResponse: translate // I feel lazy, so I'm using dynamic typing
}

main
{
  // .NET FW version
  //tinyRequest = "./TinyGrammar/TinyGrammar.exe";
  //tinyRequest.args = "./TinyGrammar/tecnicheseGrammarExample.txt";
  //tinyRequest.stdOutConsoleEnable = false;

  // .NET Core version
  // I didn't manage to pass arguments
  tinyRequest = "dotnet.exe ./TinyGrammar/NetCore/MB.TinyGrammar.NetCoreConsoleApp.dll ./TinyGrammar/tecnicheseGrammarExample.txt";
  //tinyRequest.args = " ./TinyGrammar/NetCore/MB.TinyGrammar.NetCoreConsoleApp.dll ./TinyGrammar/tecnicheseGrammarExample.txt";
  tinyRequest.stdOutConsoleEnable = false;

  exec@Exec( tinyRequest )( tecnichese );
  // Get the results
  translate@GoogleTranslate( { .q = tecnichese, .tolang = args[0] } )( response );

  // Print results
  println@Console( tecnichese )();
  // debug JSON response
  //getJsonString@JsonUtils(response)(json_resp);
  //println@Console( json_resp )();
  // Google Translate splits response in sentences, loop is needed
  for( line in response._._ ) {
    println@Console( line._ )()
  }
}

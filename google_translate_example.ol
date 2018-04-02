include "console.iol"
include "json_utils.iol"

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
  // Get the results
  translate@GoogleTranslate( { .q = args[0], .tolang = args[1] } )( response );

  // Print results
  getJsonString@JsonUtils(response)(json_resp);
  println@Console( json_resp )();
  println@Console( response._[0]._[0]._[0] )()
}
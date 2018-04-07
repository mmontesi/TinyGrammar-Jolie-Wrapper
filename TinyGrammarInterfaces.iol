type tinygrammar_request: void {
    .language: string
}

type tinygrammar_response: void {
    .sentence: string
    .translated: string
}

interface TinyGrammarInterface {
    RequestResponse: translate( tinygrammar_request )( tinygrammar_response )
}

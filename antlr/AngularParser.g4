parser grammar AngularParser;

@header{
package gen;
}

options { tokenVocab = AngularLexer; }

//   <<<<<< Angular parser

//program
//    :importStatement*
//     componentList?
//     AT_COMPONENT LPARENTHESIS LBRACE (SELECTOR COLON STRING COMMA  STANDALONE COLON (TRUE | FALSE) COMMA)
//      (cssOption COMMA)?
//      (htmlOption COMMA)?
//      RBRACE RPARENTHESIS EXPORT CLASS ID LBRACE ts RBRACE
//    ;
program
  : importStatement*
    AT_COMPONENT LPARENTHESIS LBRACE   SELECTOR COLON STRING COMMA STANDALONE COLON (TRUE | FALSE) COMMA
      (IMPORTS COLON LBRACKET componentList RBRACKET COMMA)?
      (cssOption COMMA)?
      (htmlOption COMMA)?
    RBRACE RPARENTHESIS EXPORT CLASS ID LBRACE ts RBRACE
  ;

cssOption: STYLES COLON LBRACKET BACKTICK css BACKTICK RBRACKET;
htmlOption: TEMPLATE COLON BACKTICK html BACKTICK;

importStatement
    : IMPORT ID FROM STRING SEMICOLON?
    ;

componentList
:  STRING (',' STRING)* ;

  // <<<<<<< ts parser


  ts: (attribute | method)* constructor? (attribute | method)* ;


  attribute :
             ID COLON type SEMICOLON                        #DeclareAttribute
            |ID COLON type EQUAL_SIGN literal SEMICOLON     #DeclareAndAssignAttribute
  ;



  expression:
           LET ID COLON type SEMICOLON                                          #DeclareVariable
          |LET ID COLON type EQUAL_SIGN literal SEMICOLON                       #DeclareAndAssign
          |ID EQUAL_SIGN literal SEMICOLON                                      #AssignVariable
          |(THIS)? ID EQUAL_SIGN literal SEMICOLON                              #AssignAttribute
          |IF LPARENTHESIS STRING? RPARENTHESIS  LBRACE expression* RBRACE      #If
          |FOR LPARENTHESIS STRING? RPARENTHESIS  LBRACE expression* RBRACE     #For
  ;


  constructor:CONSTRUCTOR LPARENTHESIS RPARENTHESIS  LBRACE expression* RBRACE ;


  type: NUMBER | STRINGDL | BOOLEAN | ANY  ;

  literal
      :ID                                                           #StoredID
      | STRING                                                      #String
      | NUMERIC_VALUE                                               #Number
      | (TRUE | FALSE)                                              #Boolean
      | LBRACE (ID COLON STRING (COMMA ID COLON STRING)*)? RBRACE   #KeyValue
      | LBRACKET ((literal COMMA)* literal)? RBRACKET                  #Array
      ;


  method
      : ID LPARENTHESIS methodParams? RPARENTHESIS (COLON VOID)? LBRACE expression* RBRACE
      ;


  methodParams
      : ID COLON type (COMMA ID COLON type)*
      ;

// <<<<< HTML parser
html
    : div* ;

div
    : TAG_OPEN tagName divAttribute* TAG_CLOSE
      divChild*
      TAG_OPEN_SELF tagName TAG_CLOSE        #DivNode
    ;

tagName
    : DIV
    | P
    | IMG
    | BR
    | H1 | H2 | H3 | H4 | H5 | H6
    | BUTTON
    | LABEL
    | ID
    ;


divAttribute
    : ng                      #NgDirective
    | event                   #EventBinding
    | ATTRIBUTE               #ClassOrId
    ;


divChild
    : image                             #ImageElement
    | div                               #NestedDiv
    | paragraph                         #ParagraphWrapper
    | br                                #BrTag
    | buttonElement                     #ButtonElem
    | labelElement                      #LabelElem
    ;

image
    : TAG_OPEN IMG ANGULAR_ATTRIBUTE_PROPERTY TAG_CLOSE
    | TAG_OPEN IMG ANGULAR_ATTRIBUTE_PROPERTY TAG_SELF_CLOSE   // يسمح <img .../>
    ;



paragraph
    : hElement                    #H_Element
    | pElement                  #P_Element
    ;

hElement
    : TAG_OPEN heading TAG_CLOSE ANGULAR_BINDING TAG_OPEN_SELF heading TAG_CLOSE
    ;

heading
    : H1
    | H2
    | H3
    | H4
    | H5
    | H6
    ;


pElement
    : TAG_OPEN P TAG_CLOSE ANGULAR_BINDING TAG_OPEN_SELF P TAG_CLOSE
    ;


br
    : TAG_OPEN BR TAG_CLOSE ANGULAR_BINDING
    ;

buttonElement
    : TAG_OPEN BUTTON TAG_CLOSE divChild* TAG_OPEN_SELF BUTTON TAG_CLOSE
    ;


labelElement
    : TAG_OPEN LABEL TAG_CLOSE divChild* TAG_OPEN_SELF LABEL TAG_CLOSE
    ;


ng
    : ANGULAR_ATTRIBUTE_DIRECTIVE
    ;

event
    : ANGULAR_ATTRIBUTE_EVENT
    ;


// <<<<<<<<<<<<< css parser


css:cssDeclaration*;

cssDeclaration: CSS_SELECTOR (ID)? LBRACE (cssProperty (SEMICOLON cssProperty)*)? SEMICOLON?  RBRACE;

cssProperty: property  COLON propertyValue+;

property: DISPLAY
        | MARGIN
        | FONT_FAMILY
        | PADDING
        | WIDTH
        | BORDER_RIGHT
        | OVERFLOW_Y
        | BORDER
        | CURSOR
        | TRANSITION
        | HEIGHT
        | MARGIN_RIGHT
        | BORDER_SOLID
        | COLOR
        ;

propertyValue: STRING
             | ID
             | NUMERIC_VALUE
             | COLOR_VALUE
//             | LBRACKET cssDeclaration RBRACKET
             ;



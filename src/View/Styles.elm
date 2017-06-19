module View.Styles exposing (style_tag)
import Html exposing (text, node)
import Html.Attributes exposing (class, type_)

style_text = """
#elm-guitar .bar .chord {
  float:left;
}

#elm-guitar .bar .tab-bar .chord .string{
  margin: 0px;
  line-height: 0.5;
}

#elm-guitar .bar .note-bar .chord .string{
  line-height: 0.5;
}
"""
style_tag =
  node "style" [type_ "text/css"] [text style_text]

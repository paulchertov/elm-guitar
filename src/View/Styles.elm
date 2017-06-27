module View.Styles exposing (styleTag)
import Html exposing (text, node)
import Html.Attributes exposing (class, type_)

styleText = """
#elm-guitar .bar .chord {
  float:left;
}
.chord .string {
    display: block;
}
#elm-guitar .bar .tab-bar .chord .string{
  margin: 0px;
  line-height: 0.5;
}

#elm-guitar .bar .note-bar .chord .string{
  line-height: 0.5;
}
"""

--tag containing app styles
styleTag =
  node "style" [type_ "text/css"] [text styleText]

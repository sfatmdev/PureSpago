module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import DOM (window)
import DOM.HTML (document)
import DOM.Node.Types (NodeType(..))
import DOM.HTML.Document (getElementById, createElement, createTextNode)
import DOM.HTML.Element (HTMLElement, setInnerHTML, appendChild_)
import DOM.Event.Event (Event)
import DOM.Event.Types (target)

-- Function to create a button and set up its click event
main :: Effect Unit
main = do
  log "PureScript Website Loaded"
  
  -- Get the document object
  doc <- document

  -- Create a div element
  divElement <- createElement doc "div"

  -- Set text inside the div
  setInnerHTML "<h1>Welcome to PureScript Website!</h1>" divElement

  -- Create a button element
  button <- createElement doc "button"
  setInnerHTML "Click Me!" button

  -- Add an event listener to the button
  let handleClick :: Event -> Effect Unit
      handleClick _ = log "Button clicked!"
  addEventListener button "click" handleClick

  -- Append elements to the document body
  body <- documentBody doc
  case body of
    Just b -> do
      appendChild_ b divElement
      appendChild_ b button
    Nothing -> log "Failed to find the body element"

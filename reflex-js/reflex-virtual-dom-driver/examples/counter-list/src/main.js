/* @flow */

import {init, update, view} from "./counter-list"
import {start, beginner} from "reflex"

export const app = start
  ( beginner
    ( { model:
        ( window.app == null
          ? init()
          : window.app.model.value
        )
      , update: update
      , view: view
      }
    )
  )
window.app = app

/* @flow */

import {init, update, view} from "./counter-set"
import {start, beginner} from "reflex"

export const app = start
  ( beginner
    ( { model:
        ( window.app == null
          ? init(0)
          : window.app.model.value
        )
      , update: update
      , view: view
      }
    )
  )
window.app = app

#!/usr/bin/env Rscript

require(tcltk)

## possible icons: error, info, question or warning

tkmessageBox(title="OK & Info", type = "ok", message="It has completed", icon="info")
tkmessageBox(title="Warning", type = "ok", message="It is problematic", icon="warning")
tkmessageBox(title="Error", type = "ok", message="It has crashed", icon="error")
tkmessageBox(title="OK or Cancel", type = "okcancel", message="Is that OK to go ahead?", icon="question")
tkmessageBox(title="Question", type = "yesno", message="Is that still OK?", icon="question")
tkmessageBox(title="Question", type = "yesnocancel", message="Do you want to save it?", icon="question")
tkmessageBox(title="Retry?", type = "retrycancel", message="Do you want to try again?", icon="question")
tkmessageBox(title="Abort or Retry?", type = "abortretryignore", message="Do you really want to abort?", icon="question", default="ignore")

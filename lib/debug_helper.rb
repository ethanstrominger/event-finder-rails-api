# DebugHelper
module DebugHelper
  def quickDebug(msg)
    pp "*** DEBUG ***"
    pp Rainbow(msg)
      .white.bright.background(:red)
  end
end

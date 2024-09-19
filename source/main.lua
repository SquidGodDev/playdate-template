import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd <const> = playdate
local gfx <const> = playdate.graphics

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()

    gfx.drawCircleAtPoint(200, 120, 30)
end

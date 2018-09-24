local director = {scene = 'main'}
function director:changeScene (moduleName)
    local loading 

    local w = display.contentWidth
    local h = display.contentHeight

    local background
    local logo
    local localGroup

    local loadFunction = function()
        localGroup = display.newGroup()

        background = display.newRect(localGroup, 0, 0, w, h)
        background:setFillColor(255, 255, 255)
        background.alpha = 1

        if self.scene == "main" then
            logo = display.newImageRect(localGroup, "imagens/logo.png", 250, 180)
            logo.x = w * .5
            logo.y = h * .5

            transition.from(logo, {delay=300, time=400, alpha=0, xScale=.5, yScale=.5, transition=easing.outExpo})
            transition.from(background, {delay=400, time=300, alpha=0})
        end
    end

    loadFunction()

    loading = function()              
        local loadedModule = package.loaded[self.scene]
            
        if type(loadedModule) == 'table' and type(loadedModule.clean) == 'function' then
            loadedModule.clean()
        end
            
        local group = self.view
            
        if self.scene ~= 'main' and type(loadedModule) == 'table' then
            display.remove(group)
            package.loaded[self.scene], group, loadedModule = nil
            collectgarbage('collect')
        end

        self.scene = moduleName
        require(moduleName).new()

        display.remove(background)
        background = nil

        display.remove(logo)
        logo = nil

        display.remove(localGroup)
        localGroup = nil

        loading = nil
    end

    if self.scene == "main" then
        timer.performWithDelay(2000, loading)
    else 
        transition.from(localGroup, {time=100, alpha=0, onComplete=loading})
    end
end

return director
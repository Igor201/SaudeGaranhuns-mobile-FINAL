local composer = require("composer")
local usuario = require("model.entidades.Usuario")

local LoginModel = {usuario}

function LoginModel:criar()	
	self.usuario = usuario:criar()
	return self
end

function LoginModel:logar()
	print("chegou no logar do model")
	--print(self.usuario.usuario)
	network.request("http://viacep.com.br/ws/01001000/json/", "GET", busca)		
end

function busca (event)
	if ( event.isError ) then
        print( "Network error: ", event.response )
        local u = LoginModel.usuario.usuario        
        
        if (u == "123") then
        	composer.gotoScene("view.MenuPrincipal")
        end 

    else
    	--local tabela = json.decode(event.response)
    	print(event.response)
		--LoginModel.usuario.usuario = tabela.usuario	
    end
end

return LoginModel
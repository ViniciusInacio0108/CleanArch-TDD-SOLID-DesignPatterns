Feature: Login
Como um cliente
Quero fazer login e me manter logado
Para poder entrar no app de forma rápida e fácil

Cenário: Credenciais válidas
Dado que o cliente informou credenciais válidas
Quando for fazer o login
Enviar usuário para tela de home
Manter o usuário logado

Cenário: Credeciais inválidas
Dado que o cliente informou credenciais inválidas
Quando solicitar o login
Sistema deve retornar mensagem de erro
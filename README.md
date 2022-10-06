
# Service_project

Desafio da segunda fase do projeto de trainee focado em serviços.

Funcionalidades do app:

- Login Firebase com tratamento de erros conforme FirebaseException.
- get das informações da API sendo consumidas e mostradas na tela.

O que faltou para concluir:

- Salvar no shared preference uma moeda específica
- exibir na tela principal a moeda salva no shared preference.
- realizar o calculo realtime da cotação.

Para iniciar o projeto antes precisa ser criado o arquivo .env com a BASE_URL:

BASE_URL=https://economia.awesomeapi.com.br/last/USD-BRL,AUD-BRL,CAD-BRL,EUR-BRL,JPY-BRL,GBP-BRL,CNY-BRL


Descrição das telas e seviços utilizados:


# Tela de login:

primeiramente para ser feito o login pode ser usado os seguintes dados:

email: teste50@teste.com
senha: 1q2w3e4r

Nessa tela estão sendo tratados os erros conforme o código de retorno da FirebaseException.

A ideia inicial seria criar uma classe específica para tratar os erros onde ela recebe o implements de Exception e a partir desse arquivo criar uma classe para cada erro e disparar uma snackBar para cada erro.
Não consegui fazer nesse formato, não estava sendo disparado os erros e não estava com problema de contexto.
Tentei usar o Reaction e Dispose para ser tratado os erros também, não compreendi muito o uso dele e acabou não funcionando também.
na terceira tentativa Apenas criei uma classe simples que realiza um try catch de cada erro e dispara a custom snackBar e funcionou.

Observação: acabei colocando o método para puxar as informações do get no botão de login porque estava vindo nulo ao chamar no initState da tela em questão, não consegui identificar o porque disso, foi uma gambiarra.


# Tela Currency List

para acessar essa tela após logar clique no menu no canto superior direito e vá em Currency List.
Nessa tela Logo ao acessar já é listado todo o objeto com os demais objetos dentro dele, o que eu fiz foi criar uma lista e jogar esses objetos para dentro dela, feito isso exibi cada um em um card.

Fiquei na dúvida no jeito da minha implementação se é a melhor forma ou se tem uma forma melhor de fazer isso, no arquivo currency_list_store da linha 42 até 66.

Nessa tela cheguei a colocar a o botão para favoritar, porém não está funcional, ele apenas faz um jsonEncode da lista de objetos.

A minha ideia seria salvar cada item conforme o seu Objeto respectivo daquela moeda e depois na primeira tela exibir apenas os que foram salvos, porém não entendi como fazer isso na prática.

# Tela principal do app

a ideia seria criar uma lista de Cards que retornaria o objeto salvo no Shared Preference conforme o chave em que ele foi salvo, não cheguei a tentar executar essa parte e validar que se não tivesse nenhum ele iria mostrar o objeto USDBRL como padrão.
iria criar um TextForm field abaixo, onde ao digitar ele mostraria o valor alterado no fim de cada card respectivo, não cheguei a pensar em como executar isso mas seria usando o mesmo TextEditing controller para todos e ao digitar o valor no no text field, seria multiplicado conforme o valor da cotação.

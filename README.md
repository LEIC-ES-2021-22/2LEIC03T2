# 2LEIC03T2

## Members

Daniel Rodrigues - 202006562 <br>
Duarte Lopes - 202006408 <br>
Filipe Cardoso - 202006409 <br>
Francisco Baptista - 201604320 <br>
Nuno Silva - 202005501 <br>

# Product Name
ClasStats

## Vision Stament
Desenvolvida pela comunidade, para a comunidade. <br>
A nossa visão é simples: ser a ponte entre docentes e estudantes! <br>
Ao contrário dos inquéritos pedagógicos, a nossa aplicação disponibiliza um sistema de avaliação de fácil utilização e contínuo ao longo do semestre.

## Main Features
 - Feature 1 - Avaliar aulas (por estrelas)
 - Feature 2 - Adicionar comentário opcional das aulas
 - Feature 3 - Selecionar comentários predefinidos
 - Feature 4 - Avaliar condições da sala
 - Feature 5 - Tratamento e análise dos dados recolhidos


## Required API's
- Horários das turmas
- Turmas de cada aluno
- Perfil do sigarra de cada professor


## Use Case Model

 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC03T2/blob/main/images/UseCases.png"/>
</p>

|||
| --- | --- |
| *Name* | Classificar desempenho do docente |
| *Actor* |  Estudante | 
| *Description* | O estudante classifica o docente da aula. |
| *Preconditions* | - A aula já terminou. <br>  - O estudante teve aula nessa sala nesse próprio dia (até 8 horas antes). |
| *Postconditions* |  - O rating fica registado. |
| *Normal flow* | 1. É apresentado um menu de escolha das aulas que teve nas últimas 8 horas.<br> 2. O estudante escolhe a aula que pretende classificar.<br> 3. O estudante classifica o docente da aula (0 a 5 estrelas).<br> 4. O estudante submete a sua classificação. |
| *Alternative flows and exceptions* |  |

|||
| --- | --- |
| *Name* | Classificar condições da Sala |
| *Actor* |  Estudante | 
| *Description* | O estudante classifica as condições da sala de aula, e.g. computadores, microfone, projetor, etc. |
| *Preconditions* | - A aula já terminou. <br>  - O estudante teve aula nessa sala nesse próprio dia (até 8 horas antes). |
| *Postconditions* |  - O rating fica registado. |
| *Normal flow* | 1. O estudante seleciona a opção de "Classificar sala de aula".<br> 2. É apresentado um menu com várias opções para avaliar as condições da sala em causa.<br> 3. O estudante submete a sua classificação. |
| *Alternative flows and exceptions* |  |

|||
| --- | --- |
| *Name* | Visualizar Classificação da Sala |
| *Actor* |  Estudante e Docente | 
| *Description* | O ator pode visualizar os ratings das condições da sala de aula como computador, microfone, <br> projetor, falta de cadeiras, etc. |
| *Preconditions* | - Já houve classificações da sala de aula por parte dos estudantes. |
| *Postconditions* | - O ecrã apresenta a média das classificações da respetiva sala de aula para fins analíticos. |
| *Normal flow* | 1. O ator seleciona a opção visualizar classificações.<br> 2. O ator seleciona a opção classificações de sala de aula.<br> 3. O ator pesquisa a sala de aula que pretende. |
| *Alternative flows and exceptions* | Caso ainda não tenham sido efetuadas classificações da sala por parte dos estudantes até ao momento. A aplicação retorna um feedback vazio. |

|||
| --- | --- |
| *Name* | Visualizar classificação Docente |
| *Actor* | Estudante e Docente |
| *Description* | O ator pode visualizar a classificação de um determinado docente. |
| *Preconditions* | - Pelo menos um estudante já efetuou a classificação do docente em causa. |
| *Postconditions* | - O ecrã expõe a classificação média do docente em questão. |
| *Normal flow* | 1. O ator seleciona a opção "visualizar classificação Docente". <br> 2. O ator pesquisa o nome do docente que pretende visualizar a classificação. |
| *Alternative flows and exceptions* | Caso ainda não tenham sido efetuadas classificações do docente por parte dos estudantes até ao momento. A aplicação retorna um feedback vazio. |

|||
| --- | --- |
| *Name* | Visualizar Classificação |
| *Actor* |  Docente e Estudante | 
| *Description* | O ator tem a possibilidade de visualizar a classificação do docente, que leciona uma determinada aula, tal como a classificação da sala onde a mesma é lecionada. |
| *Preconditions* | - O docente já foi avaliado pelo menos uma vez. <br>  - A sala onde leciona já foi avaliada pelo menos uma vez. |
| *Postconditions* |  - O ecrã expõe a classificação do docente, tal como a classificação da sala onde leciona. |
| *Normal flow* | 1. O ator seleciona a opção "visualizar a classificação dos docentes ".<br> 2. O ator escolhe a unidade curricular que pretende visualizar e qual o docente.<br>
| *Alternative flows and exceptions* | Caso não seja possível efetuar uma ligação com a base de dados a aplicação retorna um feedback vazio. |

## Use Case Model

 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC03T2/blob/main/images/DomainModel.jpg"/>
</p>

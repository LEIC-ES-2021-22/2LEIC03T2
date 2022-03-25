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

##User case stories
|||
| --- | --- |
| *Name* | Purchase tickets online |
| *Actor* |  Customer | 
| *Description* | The customer purchases one or more tickets for an event, using an electronic payment method, having the option to choose places. |
| *Preconditions* | - The customer has electronic payment means. <br> - The event has tickets available on-sale. |
| *Postconditions* | - The customer gets the electronic tickets with a QR code. <br> - The customer is charged of the tickets’ cost, and the seller credited. <br> - Information of tickets sold & seats available for the event is updated. |
| *Normal flow* | 1. The customer accesses the web page of the ticketing system.<br> 2. The system shows the list of events with tickets on-sale.<br> 3. The customer selects the event and the number of tickets.<br> 4. If wanted, the costumer may Choose Places.<br> 5. The system shows the total price to pay.<br> 6. The system redirects the customer to Electronic Payment.<br> 7. The system delivers the electronic tickets to the customer with a unique identifier and QR code. |
| *Alternative flows and exceptions* | 1. [Payment failure] If, in step 6 of the normal flow the payment fails, the system gives the user the possibility to cancel or retry. |

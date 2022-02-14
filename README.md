# Mercadolibre

This repository contains my Mercadolibre iOS challenge solution.

## Modules

At a firce glance, the first idea that came out to my mind was using the VIPER architecture. But, its bidirectional links that it has just seemed unnecessary.
That's why this app was made using the VIP Clean architecture.

<img width="450" alt="Screen Shot 2022-02-14 at 1 06 39 PM" src="https://user-images.githubusercontent.com/26754335/153921272-27c560f0-8577-46c0-bf8c-cfdb2fa2935c.png">

This architecture has the following components:

* **View:** It's what the user sees and what intecracts with. And it has a strong reference to the module interactor and to he router.
* **Router:** It contains all the routing logic. It has a weak reference 
* **Interactor:** It's what the user sees and what intecracts with. It has as many workers as it may need.
* **Presenter:** It contains all the presentation logic.
* **Worker:** It contains all data access logic.

If wee see the architecture as a set of layers, we have the following:

<img width="450" alt="Screen Shot 2022-02-14 at 12 55 30 PM" src="https://user-images.githubusercontent.com/26754335/153924912-29c4a653-1d36-4177-a70b-36612117f74e.png">

*Note: weak references are used to avoid memory leaks produced by reference cycles.*

### Search module

| Name | Screenshot |
| --- | --- |
| Loading view | <img width="250" alt="Screen Shot 2022-02-14 at 12 55 30 PM" src="https://user-images.githubusercontent.com/26754335/153927645-a1275c1b-f274-4e02-9e10-638721698004.png"> |
| Empty search | <img width="250" alt="Screen Shot 2022-02-14 at 12 55 30 PM" src="https://user-images.githubusercontent.com/26754335/153927384-d5cfb237-b9a4-43ec-bb54-a36ef41f3d10.png"> |
| Error view | <img width="250" alt="Screen Shot 2022-02-14 at 12 55 30 PM" src="https://user-images.githubusercontent.com/26754335/153932717-3bbf866a-1e60-45d1-8c8f-80b61901df8d.png"> |
| Search result | <img width="250" alt="Screen Shot 2022-02-14 at 12 55 30 PM" src="https://user-images.githubusercontent.com/26754335/153932032-5b61e9bc-82b8-4a77-baff-03c80e468795.png"> |

#### Test coverage

<img width="650" alt="Screen Shot 2022-02-14 at 10 58 19 AM" src="https://user-images.githubusercontent.com/26754335/153923492-2cd1d816-8304-429c-86cd-b63f20e62254.png">

### Item details module

#### Test coverage

<img width="650" alt="Screen Shot 2022-02-14 at 10 58 49 AM" src="https://user-images.githubusercontent.com/26754335/153923081-476bfa2d-9e42-4b88-a1b1-5ca27c40f7af.png">

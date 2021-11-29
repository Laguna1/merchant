# README
[Merchant](http://tutorials.jumpstartlab.com/projects/merchant.html)

Unfortunately, the guide is out of date at this point, but I went through every iteration.

This is a small project for a small online store.
The default CSS style from the tutorial is used.

- The creation of new products with the product image
- display in the list of products, 
- the product card, 
- the list of orders, 
- the order card, ability to change items quantity in the order, total sum
- the function of check of the remains of a product are developed.
- Implemented the twitter-omniauth for User authentication
- Added `address` table to choose an order`s delivery address, select in the order page

Basically, everything is working now, the deprecated methods have been updated. 

![Twitter](app/assets/images/twitter-omniauth.png)
![Products List](app/assets/images/products-list.png)


* Ruby version - `2.7.2`
- Rails version - `6.1.4.1`
- Postgres: >=9.5

* Clone this repo
- `https://github.com/Laguna1/merchant`
- `cd merchant` 

* System dependencies
- `bundle install`
* Configuration

* Database creation
- `rails db:create`

* Database initialization
- `rails db:migrate`

* Start server
- `rails s`
- Open `http://localhost:3000/` in your browser


### Author

👤 **Oksana Petrova**

- GitHub: [@github/Laguna1](https://github.com/Laguna1)
- Linkedin: [linkedin/OksanaPetrova](https://www.linkedin.com/in/oksana-petrova/)
- Twitter: [@OksanaP48303303](https://twitter.com/P01339534Oksana)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

But there are two problems: 
- 1) When I make an attempt to `submit` the order  - the order is deleted, 
- 2) accordingly, the redirection to the `confirmation` page does not work. I would be grateful for a hint in solving these problems.
Feel free to check the [issues page](https://github.com/Laguna1/merchant/issues).

## Show your support

Give a ⭐️ if you like this project!

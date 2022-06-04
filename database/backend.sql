/**
* Вывод городов
**/
SELECT * FROM cities
/**
* Поиск города в списке
**/
SELECT * FROM cities WHERE city =
/**
*   Поиск филиала в списке определённого города
*/
SELECT branches.id, street, city_id, latitude, longitude, number_phone, working_mode FROM branches WHERE street =
/**
*   Отображение акций и скидок
*/
SELECT messages.id, name_msg, name, image FROM messages LEFT JOIN type_message ON messages.type_id = type_message.id
/**
*  Отображение стрижек
**/
SELECT name_msg, name, image FROM messages LEFT JOIN type_message ON messages.type_id = type_message.id
/**
*  Отображение товаров
**/
SELECT products.id, name, type, price, description, rating, image, icon FROM products LEFT JOIN types_product ON products.type_id = types_product.id
/**
*  Отображение товаров по их типу
**/
SELECT products.id, name, type, price, description, rating, image, icon FROM products LEFT JOIN types_product ON products.type_id = types_product.id WHERE products.type_id =
/**
* 1.1 Регистрация, получение кода регистрации по электронной почте
* Удаление почты, со служебной таблицы если пользователь "затупил"
**/
INSERT INTO users_code (email, code) VALUES ('$email', $code_registration)
DELETE FROM users_code WHERE email =
/**
* 1.2 Регистрация, проверка кода регистрации
*/
SELECT * FROM users_code WHERE code =
/**
* 1.3 Регистрация, регистрация пользователя в сети
*/
INSERT INTO users (email, password, phone_number) VALUES ('$email', '$password', '$phone_number')
/**
* Подсчёт количества филиалов у города
**/
SELECT cities.id, city, COUNT(*) AS count_branches from branches, cities WHERE branches.city_id = cities.id GROUP BY branches.city_id
/**
* Авторизация пользователя
*/
SELECT users.id, email, password FROM users WHERE email = '$email' AND password = '$password'
/**
*   Получение филиалов по id города
*/
SELECT branches.id, street, latitude, longitude, number_phone, working_mode FROM branches WHERE city_id =
/**
*   Вывод всех барберов
*/
SELECT barbers.id, position, name, rating, image, street FROM barbers LEFT JOIN positions ON barbers.position_id = positions.id LEFT JOIN branches ON barbers.branch_id = branches.id
/**
*   Вывод барберов по id филиала
*/
SELECT barbers.id, position, name, rating, image, barbers.branch_id FROM barbers LEFT JOIN positions ON barbers.position_id = positions.id WHERE branch_id =
/**
*   Восстановление (смена) пароля
*/
UPDATE users SET password = '$password' WHERE users.email = '$email'

select city, street from city_branch left join cities on city_branch.city_id = cities.id LEFT JOIN branches on city_branch.branch_id = branches.id




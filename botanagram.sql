-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 24 2021 г., 21:36
-- Версия сервера: 10.4.17-MariaDB
-- Версия PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `botanagram`
--

-- --------------------------------------------------------

--
-- Структура таблицы `chat_info`
--

CREATE TABLE `chat_info` (
  `chat_id` int(11) NOT NULL,
  `game_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `chat_info`
--

INSERT INTO `chat_info` (`chat_id`, `game_level`) VALUES
(67, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `text` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`event_id`, `chat_id`, `text`) VALUES
(0, 67, 'Бот добавлен в чат'),
(0, 67, 'Бот добавлен в чат'),
(0, 67, 'Бот добавлен в чат'),
(0, 67, 'Начата игра'),
(0, 67, 'Начата игра');

-- --------------------------------------------------------

--
-- Структура таблицы `winner`
--

CREATE TABLE `winner` (
  `winner_id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reaction` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `winner`
--

INSERT INTO `winner` (`winner_id`, `chat_id`, `user_id`, `reaction`) VALUES
(1, 67, 445917049, 2.542),
(2, 67, 456094299, 4.413),
(3, 67, 445917049, 9.009),
(4, 67, 456094299, 4.745),
(5, 67, 456094299, 4.046),
(6, 67, 456094299, 4.183),
(7, 67, 456094299, 6.191),
(8, 67, 456094299, 7.928),
(9, 67, 456094299, 3.171),
(10, 67, 456094299, 4.122),
(11, 67, 456094299, 10.358),
(12, 67, 456094299, 6.856),
(13, 67, 445917049, 10.169),
(14, 67, 456094299, 2.708),
(15, 67, 456094299, 14.474),
(16, 67, 456094299, 10.575);

-- --------------------------------------------------------

--
-- Структура таблицы `words`
--

CREATE TABLE `words` (
  `word_id` int(11) NOT NULL,
  `word` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `words`
--

INSERT INTO `words` (`word_id`, `word`) VALUES
(0, 'год'),
(0, 'человек'),
(0, 'время'),
(0, 'дело'),
(0, 'жизнь'),
(0, 'день'),
(0, 'рука'),
(0, 'работа'),
(0, 'слово'),
(0, 'место'),
(0, 'вопрос'),
(0, 'лицо'),
(0, 'глаз'),
(0, 'страна'),
(0, 'друг'),
(0, 'сторона'),
(0, 'дом'),
(0, 'случай'),
(0, 'ребенок'),
(0, 'голова'),
(0, 'система'),
(0, 'вид'),
(0, 'конец'),
(0, 'отношение'),
(0, 'город'),
(0, 'часть'),
(0, 'женщина'),
(0, 'проблема'),
(0, 'земля'),
(0, 'решение'),
(0, 'власть'),
(0, 'машина'),
(0, 'закон'),
(0, 'час'),
(0, 'образ'),
(0, 'отец'),
(0, 'история'),
(0, 'нога'),
(0, 'вода'),
(0, 'война'),
(0, 'возможность'),
(0, 'компания'),
(0, 'результат'),
(0, 'дверь'),
(0, 'бог'),
(0, 'народ'),
(0, 'область'),
(0, 'число'),
(0, 'голос'),
(0, 'развитие'),
(0, 'группа'),
(0, 'жена'),
(0, 'процесс'),
(0, 'условие'),
(0, 'книга'),
(0, 'ночь'),
(0, 'суд'),
(0, 'деньга'),
(0, 'уровень'),
(0, 'начало'),
(0, 'государство'),
(0, 'стол'),
(0, 'средство'),
(0, 'связь'),
(0, 'имя'),
(0, 'президент'),
(0, 'форма'),
(0, 'путь'),
(0, 'организация'),
(0, 'качество'),
(0, 'действие'),
(0, 'статья'),
(0, 'общество'),
(0, 'ситуация'),
(0, 'деятельность'),
(0, 'школа'),
(0, 'душа'),
(0, 'дорога'),
(0, 'язык'),
(0, 'взгляд'),
(0, 'момент'),
(0, 'минута'),
(0, 'месяц'),
(0, 'порядок'),
(0, 'цель'),
(0, 'программа'),
(0, 'муж'),
(0, 'помощь'),
(0, 'мысль'),
(0, 'вечер'),
(0, 'орган'),
(0, 'правительство'),
(0, 'рынок'),
(0, 'предприятие'),
(0, 'партия'),
(0, 'роль'),
(0, 'смысл'),
(0, 'мама'),
(0, 'мера'),
(0, 'улица'),
(0, 'состояние'),
(0, 'задача'),
(0, 'информация'),
(0, 'театр'),
(0, 'внимание'),
(0, 'производство'),
(0, 'квартира'),
(0, 'труд'),
(0, 'тело'),
(0, 'письмо'),
(0, 'центр'),
(0, 'утро'),
(0, 'мать'),
(0, 'комната'),
(0, 'семья'),
(0, 'сын'),
(0, 'смерть'),
(0, 'положение'),
(0, 'интерес'),
(0, 'федерация'),
(0, 'век'),
(0, 'идея'),
(0, 'управление'),
(0, 'автор'),
(0, 'окно'),
(0, 'ответ'),
(0, 'совет'),
(0, 'разговор'),
(0, 'мужчина'),
(0, 'ряд'),
(0, 'счет'),
(0, 'мнение'),
(0, 'цена'),
(0, 'точка'),
(0, 'план'),
(0, 'проект'),
(0, 'глава'),
(0, 'материал'),
(0, 'основа'),
(0, 'причина'),
(0, 'движение'),
(0, 'культура'),
(0, 'сердце'),
(0, 'рубль'),
(0, 'наука'),
(0, 'документ'),
(0, 'неделя'),
(0, 'вещь'),
(0, 'чувство'),
(0, 'правило'),
(0, 'служба'),
(0, 'газета'),
(0, 'срок'),
(0, 'институт'),
(0, 'член'),
(0, 'ход'),
(0, 'стена'),
(0, 'директор'),
(0, 'плечо'),
(0, 'опыт'),
(0, 'встреча'),
(0, 'принцип'),
(0, 'событие'),
(0, 'структура'),
(0, 'количество'),
(0, 'товарищ'),
(0, 'создание'),
(0, 'значение'),
(0, 'объект'),
(0, 'гражданин'),
(0, 'очередь'),
(0, 'период'),
(0, 'образование'),
(0, 'состав'),
(0, 'пример'),
(0, 'лес'),
(0, 'исследование'),
(0, 'девушка'),
(0, 'данные'),
(0, 'палец'),
(0, 'судьба'),
(0, 'тип'),
(0, 'метод'),
(0, 'политика'),
(0, 'армия'),
(0, 'брат'),
(0, 'представитель'),
(0, 'борьба'),
(0, 'использование'),
(0, 'шаг'),
(0, 'игра'),
(0, 'участие'),
(0, 'территория'),
(0, 'край'),
(0, 'размер'),
(0, 'номер'),
(0, 'район'),
(0, 'население'),
(0, 'банк'),
(0, 'начальник'),
(0, 'класс'),
(0, 'зал'),
(0, 'изменение'),
(0, 'большинство'),
(0, 'характер'),
(0, 'кровь'),
(0, 'направление'),
(0, 'позиция'),
(0, 'герой'),
(0, 'течение'),
(0, 'девочка'),
(0, 'искусство'),
(0, 'гость'),
(0, 'воздух'),
(0, 'мальчик'),
(0, 'фильм'),
(0, 'договор'),
(0, 'регион'),
(0, 'выбор'),
(0, 'свобода'),
(0, 'врач'),
(0, 'экономика'),
(0, 'небо'),
(0, 'факт'),
(0, 'церковь'),
(0, 'завод'),
(0, 'фирма'),
(0, 'бизнес'),
(0, 'союз'),
(0, 'деньги'),
(0, 'специалист'),
(0, 'род'),
(0, 'команда'),
(0, 'руководитель'),
(0, 'спина'),
(0, 'дух'),
(0, 'музыка'),
(0, 'способ'),
(0, 'хозяин'),
(0, 'поле'),
(0, 'доллар'),
(0, 'память'),
(0, 'природа'),
(0, 'дерево'),
(0, 'оценка'),
(0, 'объем'),
(0, 'картина'),
(0, 'процент'),
(0, 'требование'),
(0, 'писатель'),
(0, 'сцена'),
(0, 'анализ'),
(0, 'основание'),
(0, 'повод'),
(0, 'вариант'),
(0, 'берег'),
(0, 'модель'),
(0, 'степень'),
(0, 'самолет'),
(0, 'телефон'),
(0, 'граница'),
(0, 'песня'),
(0, 'половина'),
(0, 'министр'),
(0, 'угол'),
(0, 'зрение'),
(0, 'предмет'),
(0, 'литература'),
(0, 'операция'),
(0, 'двор'),
(0, 'спектакль'),
(0, 'руководство'),
(0, 'солнце'),
(0, 'автомобиль'),
(0, 'родитель'),
(0, 'участник'),
(0, 'журнал'),
(0, 'база'),
(0, 'пространство'),
(0, 'защита'),
(0, 'название'),
(0, 'стих'),
(0, 'ум'),
(0, 'море'),
(0, 'удар'),
(0, 'знание'),
(0, 'солдат'),
(0, 'миллион'),
(0, 'строительство'),
(0, 'технология'),
(0, 'председатель'),
(0, 'сон'),
(0, 'сознание'),
(0, 'бумага'),
(0, 'реформа'),
(0, 'оружие'),
(0, 'линия'),
(0, 'текст'),
(0, 'выход'),
(0, 'ребята'),
(0, 'магазин'),
(0, 'соответствие'),
(0, 'участок'),
(0, 'услуга'),
(0, 'поэт'),
(0, 'предложение'),
(0, 'желание'),
(0, 'пара'),
(0, 'успех'),
(0, 'среда'),
(0, 'возраст'),
(0, 'комплекс'),
(0, 'бюджет'),
(0, 'представление'),
(0, 'площадь'),
(0, 'генерал'),
(0, 'господин'),
(0, 'дочь'),
(0, 'понятие'),
(0, 'кабинет'),
(0, 'безопасность'),
(0, 'фонд'),
(0, 'сфера'),
(0, 'папа'),
(0, 'сотрудник'),
(0, 'продукция'),
(0, 'будущее'),
(0, 'продукт'),
(0, 'содержание'),
(0, 'художник'),
(0, 'республика'),
(0, 'сумма'),
(0, 'контроль'),
(0, 'парень'),
(0, 'ветер'),
(0, 'хозяйство'),
(0, 'помочь'),
(0, 'курс'),
(0, 'губа'),
(0, 'река'),
(0, 'грудь'),
(0, 'огонь'),
(0, 'нос'),
(0, 'волос'),
(0, 'ухо'),
(0, 'отсутствие'),
(0, 'радость'),
(0, 'сад'),
(0, 'подготовка'),
(0, 'необходимость'),
(0, 'доктор'),
(0, 'лето'),
(0, 'камень'),
(0, 'здание'),
(0, 'капитан'),
(0, 'собака'),
(0, 'итог'),
(0, 'рис'),
(0, 'техника'),
(0, 'элемент'),
(0, 'источник'),
(0, 'деревня'),
(0, 'депутат'),
(0, 'проведение'),
(0, 'рот'),
(0, 'масса'),
(0, 'комиссия'),
(0, 'цвет'),
(0, 'рассказ'),
(0, 'функция'),
(0, 'определение'),
(0, 'мужик'),
(0, 'обеспечение'),
(0, 'обстоятельство'),
(0, 'работник'),
(0, 'разработка'),
(0, 'лист'),
(0, 'звезда'),
(0, 'гора'),
(0, 'применение'),
(0, 'победа'),
(0, 'товар'),
(0, 'воля'),
(0, 'зона'),
(0, 'предел'),
(0, 'целое'),
(0, 'личность'),
(0, 'офицер'),
(0, 'влияние'),
(0, 'поддержка'),
(0, 'ответственность'),
(0, 'цветок'),
(0, 'праздник'),
(0, 'немец'),
(0, 'бой'),
(0, 'сестра'),
(0, 'господь'),
(0, 'учитель'),
(0, 'многое'),
(0, 'рамка'),
(0, 'практика'),
(0, 'показатель'),
(0, 'метр'),
(0, 'войско'),
(0, 'частность'),
(0, 'особенность'),
(0, 'снег'),
(0, 'комитет'),
(0, 'налог'),
(0, 'акт'),
(0, 'отдел'),
(0, 'карман'),
(0, 'вывод'),
(0, 'норма'),
(0, 'читатель'),
(0, 'этап'),
(0, 'сравнение'),
(0, 'прошлое'),
(0, 'фамилия'),
(0, 'кухня'),
(0, 'заявление'),
(0, 'доля'),
(0, 'пункт'),
(0, 'студент'),
(0, 'учет'),
(0, 'впечатление'),
(0, 'доход'),
(0, 'вирус'),
(0, 'клетка'),
(0, 'удовольствие'),
(0, 'теория'),
(0, 'враг'),
(0, 'собрание'),
(0, 'бутылка'),
(0, 'расчет'),
(0, 'го'),
(0, 'режим'),
(0, 'множество'),
(0, 'клуб'),
(0, 'попытка'),
(0, 'зуб'),
(0, 'сеть'),
(0, 'семь'),
(0, 'министерство'),
(0, 'прием'),
(0, 'боль'),
(0, 'сожаление'),
(0, 'кожа'),
(0, 'субъект'),
(0, 'знак'),
(0, 'актер'),
(0, 'ресурс'),
(0, 'акция'),
(0, 'газ'),
(0, 'журналист'),
(0, 'звук'),
(0, 'передача'),
(0, 'здоровье'),
(0, 'администрация'),
(0, 'болезнь'),
(0, 'детство'),
(0, 'мастер'),
(0, 'выборы'),
(0, 'зима'),
(0, 'подход'),
(0, 'поиск'),
(0, 'механизм'),
(0, 'выражение'),
(0, 'скорость'),
(0, 'ощущение'),
(0, 'стоимость'),
(0, 'коридор'),
(0, 'ошибка'),
(0, 'лидер'),
(0, 'карта'),
(0, 'заседание'),
(0, 'глубина'),
(0, 'хлеб'),
(0, 'поверхность'),
(0, 'энергия'),
(0, 'нарушение'),
(0, 'реализация'),
(0, 'революция'),
(0, 'поведение'),
(0, 'профессор'),
(0, 'исполнение'),
(0, 'заместитель'),
(0, 'суть'),
(0, 'станция'),
(0, 'реакция'),
(0, 'десяток'),
(0, 'столица'),
(0, 'формирование'),
(0, 'поколение'),
(0, 'дума'),
(0, 'существование'),
(0, 'продажа'),
(0, 'список'),
(0, 'способность'),
(0, 'противник'),
(0, 'схема'),
(0, 'долг'),
(0, 'режиссер'),
(0, 'отличие'),
(0, 'колено'),
(0, 'дед'),
(0, 'свойство'),
(0, 'этаж'),
(0, 'секунда'),
(0, 'фактор'),
(0, 'житель'),
(0, 'явление'),
(0, 'высота'),
(0, 'сосед'),
(0, 'усилие'),
(0, 'рождение'),
(0, 'расход'),
(0, 'остров'),
(0, 'фигура'),
(0, 'наличие'),
(0, 'дядя'),
(0, 'милиция'),
(0, 'растение'),
(0, 'существо'),
(0, 'черт'),
(0, 'бабушка'),
(0, 'законодательство'),
(0, 'собственность'),
(0, 'отрасль'),
(0, 'слеза'),
(0, 'волна'),
(0, 'стекло'),
(0, 'традиция'),
(0, 'январь'),
(0, 'оборудование'),
(0, 'зависимость'),
(0, 'фраза'),
(0, 'декабрь'),
(0, 'сведение'),
(0, 'трубка'),
(0, 'сентябрь'),
(0, 'университет'),
(0, 'командир'),
(0, 'храм'),
(0, 'повышение'),
(0, 'стиль'),
(0, 'артист'),
(0, 'больница'),
(0, 'одежда'),
(0, 'охрана'),
(0, 'водка'),
(0, 'кодекс'),
(0, 'имущество'),
(0, 'птица'),
(0, 'переход'),
(0, 'красота'),
(0, 'клиент'),
(0, 'толпа'),
(0, 'адрес'),
(0, 'отделение'),
(0, 'октябрь'),
(0, 'чудо'),
(0, 'счастие'),
(0, 'улыбка'),
(0, 'ужас'),
(0, 'аппарат'),
(0, 'корабль'),
(0, 'родина'),
(0, 'животное'),
(0, 'черта'),
(0, 'известие'),
(0, 'понимание'),
(0, 'тень'),
(0, 'апрель'),
(0, 'коллега'),
(0, 'преступление'),
(0, 'рыба'),
(0, 'кресло'),
(0, 'запах'),
(0, 'выставка'),
(0, 'князь'),
(0, 'фотография'),
(0, 'весна'),
(0, 'помещение'),
(0, 'эпоха'),
(0, 'занятие'),
(0, 'произведение'),
(0, 'концерт'),
(0, 'ладонь'),
(0, 'дама'),
(0, 'сомнение'),
(0, 'американец'),
(0, 'середина'),
(0, 'зарплата'),
(0, 'тайна'),
(0, 'запад'),
(0, 'июнь'),
(0, 'беседа'),
(0, 'фронт'),
(0, 'поезд'),
(0, 'должность'),
(0, 'баба'),
(0, 'промышленность'),
(0, 'музей'),
(0, 'судья'),
(0, 'получение'),
(0, 'полковник'),
(0, 'зритель'),
(0, 'секретарь'),
(0, 'установка'),
(0, 'поток'),
(0, 'ценность'),
(0, 'образец'),
(0, 'страница'),
(0, 'перспектива'),
(0, 'трава'),
(0, 'чиновник'),
(0, 'мозг'),
(0, 'сотня'),
(0, 'лагерь'),
(0, 'выступление'),
(0, 'оборона'),
(0, 'постановление'),
(0, 'честь'),
(0, 'настроение'),
(0, 'кровать'),
(0, 'характеристика'),
(0, 'обязанность'),
(0, 'шея'),
(0, 'крыша'),
(0, 'появление'),
(0, 'учреждение'),
(0, 'признак'),
(0, 'труба'),
(0, 'жертва'),
(0, 'беда'),
(0, 'фон'),
(0, 'организм'),
(0, 'ученик'),
(0, 'заключение'),
(0, 'выполнение'),
(0, 'канал'),
(0, 'исключение'),
(0, 'дача'),
(0, 'соглашение'),
(0, 'осень'),
(0, 'польза'),
(0, 'стул'),
(0, 'июль'),
(0, 'дождь'),
(0, 'сутки'),
(0, 'еврей'),
(0, 'конкурс'),
(0, 'открытие'),
(0, 'телевизор'),
(0, 'лошадь'),
(0, 'температура'),
(0, 'приказ'),
(0, 'лестница'),
(0, 'реклама'),
(0, 'спор'),
(0, 'подруга'),
(0, 'угроза'),
(0, 'конфликт'),
(0, 'изучение'),
(0, 'вино'),
(0, 'концепция'),
(0, 'достижение'),
(0, 'сообщение'),
(0, 'объединение'),
(0, 'обстановка'),
(0, 'костюм'),
(0, 'ключ'),
(0, 'ресторан'),
(0, 'назначение'),
(0, 'царь'),
(0, 'воспоминание'),
(0, 'увеличение'),
(0, 'вкус'),
(0, 'мероприятие'),
(0, 'лоб'),
(0, 'слой'),
(0, 'восток'),
(0, 'последствие'),
(0, 'принятие'),
(0, 'сотрудничество'),
(0, 'нефть'),
(0, 'слух'),
(0, 'бок'),
(0, 'переговоры'),
(0, 'тюрьма'),
(0, 'кандидат'),
(0, 'просьба'),
(0, 'реальность'),
(0, 'подарок'),
(0, 'категория'),
(0, 'потребность'),
(0, 'быль'),
(0, 'редакция'),
(0, 'очко'),
(0, 'километр'),
(0, 'губернатор'),
(0, 'новость'),
(0, 'инструмент'),
(0, 'потеря'),
(0, 'взаимодействие'),
(0, 'звонок'),
(0, 'кусок'),
(0, 'капитал'),
(0, 'грех'),
(0, 'перевод'),
(0, 'партнер'),
(0, 'ноябрь'),
(0, 'молодежь'),
(0, 'тишина'),
(0, 'творчество'),
(0, 'книжка'),
(0, 'мясо'),
(0, 'масло'),
(0, 'деталь'),
(0, 'инженер'),
(0, 'оплата'),
(0, 'эксперт'),
(0, 'кремль'),
(0, 'февраль'),
(0, 'следствие'),
(0, 'пьеса'),
(0, 'билет'),
(0, 'урок'),
(0, 'коллектив'),
(0, 'устройство'),
(0, 'палата'),
(0, 'площадка'),
(0, 'опасность'),
(0, 'пропасть'),
(0, 'воздействие'),
(0, 'разница'),
(0, 'родственник'),
(0, 'сезон'),
(0, 'издание'),
(0, 'человечество'),
(0, 'снижение'),
(0, 'запас'),
(0, 'крик'),
(0, 'публика'),
(0, 'вещество'),
(0, 'экран'),
(0, 'эффект'),
(0, 'ящик'),
(0, 'ракета'),
(0, 'водитель'),
(0, 'пакет'),
(0, 'зеркало'),
(0, 'вес'),
(0, 'дно'),
(0, 'вагон'),
(0, 'убийство'),
(0, 'тон'),
(0, 'щека'),
(0, 'дурак'),
(0, 'длина'),
(0, 'давление'),
(0, 'двигатель'),
(0, 'камера'),
(0, 'обращение'),
(0, 'формула'),
(0, 'запись'),
(0, 'крыло'),
(0, 'поездка'),
(0, 'гостиница'),
(0, 'колесо'),
(0, 'разрешение'),
(0, 'торговля'),
(0, 'академия'),
(0, 'доклад'),
(0, 'общение'),
(0, 'присутствие'),
(0, 'процедура'),
(0, 'испытание'),
(0, 'нож'),
(0, 'проверка'),
(0, 'коммунист'),
(0, 'цифра'),
(0, 'полет'),
(0, 'стакан'),
(0, 'эффективность'),
(0, 'обучение'),
(0, 'портрет'),
(0, 'достоинство'),
(0, 'рассмотрение'),
(0, 'владелец'),
(0, 'жилье'),
(0, 'компьютер'),
(0, 'корень'),
(0, 'смена'),
(0, 'доказательство'),
(0, 'кадр'),
(0, 'лейтенант'),
(0, 'признание'),
(0, 'темнота'),
(0, 'пистолет'),
(0, 'наблюдение'),
(0, 'мост'),
(0, 'ремонт'),
(0, 'истина'),
(0, 'вход'),
(0, 'политик'),
(0, 'живот'),
(0, 'кредит'),
(0, 'шум'),
(0, 'обед'),
(0, 'недостаток'),
(0, 'памятник'),
(0, 'вершина'),
(0, 'серия'),
(0, 'эксперимент'),
(0, 'сущность'),
(0, 'транспорт'),
(0, 'инициатива'),
(0, 'активность'),
(0, 'конференция'),
(0, 'кулак'),
(0, 'доска'),
(0, 'ожидание'),
(0, 'платье'),
(0, 'смех'),
(0, 'отказ'),
(0, 'сбор'),
(0, 'пенсия'),
(0, 'буква'),
(0, 'порог'),
(0, 'автобус'),
(0, 'воспитание'),
(0, 'производитель'),
(0, 'полоса'),
(0, 'риск'),
(0, 'пиво'),
(0, 'корпус'),
(0, 'штаб'),
(0, 'кольцо'),
(0, 'постель'),
(0, 'выпуск'),
(0, 'дворец'),
(0, 'брак'),
(0, 'прокурор'),
(0, 'печать'),
(0, 'окончание'),
(0, 'автомат'),
(0, 'тенденция'),
(0, 'следователь'),
(0, 'штат'),
(0, 'куст'),
(0, 'старуха'),
(0, 'описание'),
(0, 'психология'),
(0, 'шутка'),
(0, 'съезд'),
(0, 'ставка'),
(0, 'забота'),
(0, 'величина'),
(0, 'версия'),
(0, 'мешок'),
(0, 'конструкция'),
(0, 'контакт'),
(0, 'шанс'),
(0, 'лодка'),
(0, 'редактор'),
(0, 'заказ'),
(0, 'кофе'),
(0, 'рубеж'),
(0, 'статус'),
(0, 'спорт'),
(0, 'покой'),
(0, 'кризис'),
(0, 'взрыв'),
(0, 'профессия'),
(0, 'дым'),
(0, 'металл'),
(0, 'сапог'),
(0, 'диван'),
(0, 'интернет'),
(0, 'почва'),
(0, 'лед'),
(0, 'подразделение'),
(0, 'минимум'),
(0, 'конь'),
(0, 'дружба'),
(0, 'вина'),
(0, 'замок'),
(0, 'мечта'),
(0, 'сигнал'),
(0, 'талант'),
(0, 'мгновение'),
(0, 'столик'),
(0, 'затрата'),
(0, 'золото'),
(0, 'миг'),
(0, 'плата'),
(0, 'подъезд'),
(0, 'масштаб'),
(0, 'обсуждение'),
(0, 'сделка'),
(0, 'обязательство'),
(0, 'расстояние'),
(0, 'отдых'),
(0, 'телевидение'),
(0, 'тетя'),
(0, 'яблоко'),
(0, 'свидетель'),
(0, 'монастырь'),
(0, 'чтение'),
(0, 'параметр'),
(0, 'кампания'),
(0, 'помощник'),
(0, 'полк'),
(0, 'мощность'),
(0, 'сюжет'),
(0, 'потолок'),
(0, 'регистрация'),
(0, 'майор'),
(0, 'эксплуатация'),
(0, 'озеро'),
(0, 'новое'),
(0, 'атмосфера'),
(0, 'премия'),
(0, 'совесть'),
(0, 'предприниматель'),
(0, 'мальчишка'),
(0, 'дочка'),
(0, 'приятель'),
(0, 'начальство'),
(0, 'препарат'),
(0, 'село'),
(0, 'обработка'),
(0, 'танк'),
(0, 'милиционер'),
(0, 'ручка'),
(0, 'возвращение'),
(0, 'прокуратура'),
(0, 'ворота'),
(0, 'молоко'),
(0, 'еда'),
(0, 'сказка'),
(0, 'краска'),
(0, 'хвост'),
(0, 'сигарета'),
(0, 'введение'),
(0, 'покупатель'),
(0, 'поворот'),
(0, 'москвич'),
(0, 'ограничение'),
(0, 'инвестиция'),
(0, 'нация'),
(0, 'набор'),
(0, 'поселок'),
(0, 'дыхание'),
(0, 'адвокат'),
(0, 'сумка'),
(0, 'пресса'),
(0, 'корреспондент'),
(0, 'песок'),
(0, 'удивление'),
(0, 'потребитель'),
(0, 'указание'),
(0, 'изображение'),
(0, 'счастье'),
(0, 'мэр'),
(0, 'согласие'),
(0, 'действительность'),
(0, 'планета'),
(0, 'агентство'),
(0, 'танец'),
(0, 'библиотека'),
(0, 'финансирование'),
(0, 'объяснение'),
(0, 'распределение'),
(0, 'конституция'),
(0, 'таблица'),
(0, 'поэзия'),
(0, 'термин'),
(0, 'прибыль'),
(0, 'стандарт'),
(0, 'восторг'),
(0, 'гибель'),
(0, 'изделие'),
(0, 'темп'),
(0, 'вооружение'),
(0, 'осуществление'),
(0, 'уход'),
(0, 'чемпионат'),
(0, 'молитва'),
(0, 'контракт'),
(0, 'философия'),
(0, 'горло'),
(0, 'оборот'),
(0, 'кость'),
(0, 'ведомство'),
(0, 'преимущество'),
(0, 'мина'),
(0, 'полномочие');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `winner`
--
ALTER TABLE `winner`
  ADD PRIMARY KEY (`winner_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `winner`
--
ALTER TABLE `winner`
  MODIFY `winner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

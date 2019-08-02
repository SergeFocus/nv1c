#Область Форма

#Область События

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ОбъектБазыВыгрузка = Параметры.ОбъектБазы;
	
	ОпределитьТипОбъекта(ОбъектБазыВыгрузка, ОбъектБазыВыгрузкаЭтоДокумент, ОбъектБазыВыгрузкаЭтоСправочник);
	
	УстановитьСвойстваЭлементовФормы(ЭтаФорма);
	
	ОбъектБазыРедакторXMLОбновитьДанные();
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	
	Если Источник = "Навигатор" Тогда
		
		Если ИмяСобытия = "ЗакрытьВсеОкнаРедакторов" Тогда
			
			Попытка
				Закрыть();
			Исключение
				//
			КонецПопытки;
			
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область Элементы

&НаКлиенте
Процедура ОбъектБазыВыгрузкаПриИзменении(Элемент)
	
	ОпределитьТипОбъекта(ОбъектБазыВыгрузка, ОбъектБазыВыгрузкаЭтоДокумент, ОбъектБазыВыгрузкаЭтоСправочник);
	
	УстановитьСвойстваЭлементовФормы(ЭтаФорма);
	
	ТаблицаНайденныхСсылок.Очистить();
	
КонецПроцедуры

&НаКлиенте
Процедура ОбъектБазыВыгрузкаОчистка(Элемент, СтандартнаяОбработка)
	
	ОпределитьТипОбъекта(ОбъектБазыВыгрузка, ОбъектБазыВыгрузкаЭтоДокумент, ОбъектБазыВыгрузкаЭтоСправочник);
	
	УстановитьСвойстваЭлементовФормы(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура ОбъектБазыРедакторXMLОчистка(Элемент, СтандартнаяОбработка)
	
	ДанныеXML = "";
	
КонецПроцедуры

&НаКлиенте
Процедура ОбъектБазыРедакторXMLПриИзменении(Элемент)
	
	ОбъектБазыРедакторXMLОбновитьДанные();
	
КонецПроцедуры

&НаКлиенте
Процедура ВыгружатьСсылкиНаОбъектПриИзменении(Элемент)
	
	УстановитьСвойстваЭлементовФормы(ЭтаФорма);
	
КонецПроцедуры

#КонецОбласти

#Область Таблицы

#Область ТаблицаНайденныхСсылок

#Область События

&НаКлиенте
Процедура ТаблицаНайденныхСсылокВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	ТаблицаНайденныхСсылокОткрытьВРедактореОбъекта();
	
КонецПроцедуры

#КонецОбласти

#Область Команды

&НаКлиенте
Процедура КомандаТаблицаНайденныхСсылокУстановитьПометки(Команда)
	
	Для каждого стр_ТаблицаНайденныхСсылок Из ТаблицаНайденныхСсылок Цикл
		стр_ТаблицаНайденныхСсылок.Пометка = Истина;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаТаблицаНайденныхСсылокСнятьПометки(Команда)
	
	Для каждого стр_ТаблицаНайденныхСсылок Из ТаблицаНайденныхСсылок Цикл
		стр_ТаблицаНайденныхСсылок.Пометка = Ложь;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаТаблицаНайденныхСсылокСнятьПометкиВыгружатьПоСсылкам(Команда)
	
	Для каждого стр_ТаблицаНайденныхСсылок Из ТаблицаНайденныхСсылок Цикл
		стр_ТаблицаНайденныхСсылок.ВыгружатьПоСсылкам = Ложь;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаТаблицаНайденныхСсылокУстановитьПометкиВыгружатьПоСсылкам(Команда)
	
	Для каждого стр_ТаблицаНайденныхСсылок Из ТаблицаНайденныхСсылок Цикл
		стр_ТаблицаНайденныхСсылок.ВыгружатьПоСсылкам = Истина;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаТаблицаНайденныхСсылокОткрытьВРедактореОбъекта(Команда)
	
	ТаблицаНайденныхСсылокОткрытьВРедактореОбъекта();
	
КонецПроцедуры

#КонецОбласти 

#Область Процедуры

&НаКлиенте
Процедура ТаблицаНайденныхСсылокОткрытьВРедактореОбъекта()
	
	#Область Предусловия
	
	ТекущиеДанные = Элементы.ТаблицаНайденныхСсылок.ТекущиеДанные;
	
	Если (ТекущиеДанные = Неопределено) Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ЭтоСтрокаКлючаЗаписи = ЭтоСтрокаКлючаЗаписиРегистра(ТекущиеДанные.ИмяТипа);
	
	Если ЭтоСтрокаКлючаЗаписи Тогда
		
		ПараметрыФормы = Новый Структура();
		
		ПолноеИмяФормы = ПолноеИмяФормыОбработки(ЭтаФорма.ИмяФормы, "РедакторЗаписи");
		ОткрытьФорму(ПолноеИмяФормы, ПараметрыФормы, ЭтаФорма, Истина);
		
	Иначе
		
		ПараметрыФормы = Новый Структура("ОбъектБазы", ТекущиеДанные.Данные);
		
		ПолноеИмяФормы = ПолноеИмяФормыОбработки(ЭтаФорма.ИмяФормы, "РедакторОбъекта");
		ОткрытьФорму(ПолноеИмяФормы, ПараметрыФормы, ЭтаФорма, Истина);
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#КонецОбласти

#Область Команды

&НаКлиенте
Процедура КомандаЗагрузитьДанныеОбъектаXML(Команда)
	
	ОчиститьСообщения();
	
	ЗагрузитьДанныеОбъектаXMLНаКлиенте();
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаВыгрузитьДанныеОбъектаXML(Команда)
	
	ОчиститьСообщения();
	
	ВыгрузитьДанныеОбъектаXMLНаКлиенте();
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаОбновитьДанныеXML(Команда)
	
	ОбъектБазыРедакторXMLОбновитьДанные();
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаПрименитьИзмененияXMLДляОбъектаБазы(Команда)
	
	ЗагрузитьДанныеОбъектаXMLИзРедактора();
	
	ОбъектБазыРедакторXMLОбновитьДанные();
	
	ОпределитьТипОбъекта(ОбъектБазыЗагрузка, ОбъектБазыВыгрузкаЭтоДокумент, ОбъектБазыВыгрузкаЭтоСправочник);
	
	УстановитьСвойстваЭлементовФормы(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаОбъектБазыВыгрузкаОткрытьВРедактореОбъекта(Команда)
	
	ПараметрыФормы = Новый Структура("ОбъектБазы", ОбъектБазыВыгрузка);
	
	ПолноеИмяФормы = ПолноеИмяФормыОбработки(ЭтаФорма.ИмяФормы, "РедакторОбъекта");
	ОткрытьФорму(ПолноеИмяФормы, ПараметрыФормы, ЭтаФорма, Истина);
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаОбъектБазыЗагрузкаОткрытьВРедактореОбъекта(Команда)
	
	ПараметрыФормы = Новый Структура("ОбъектБазы", ОбъектБазыЗагрузка);
	
	ПолноеИмяФормы = ПолноеИмяФормыОбработки(ЭтаФорма.ИмяФормы, "РедакторОбъекта");
	ОткрытьФорму(ПолноеИмяФормы, ПараметрыФормы, ЭтаФорма, Истина);
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаОбъектБазыРедакторXMLОткрытьвРедактореОбъекта(Команда)
	
	ПараметрыФормы = Новый Структура("ОбъектБазы", ОбъектБазыРедакторXML);
	
	ПолноеИмяФормы = ПолноеИмяФормыОбработки(ЭтаФорма.ИмяФормы, "РедакторОбъекта");
	ОткрытьФорму(ПолноеИмяФормы, ПараметрыФормы, ЭтаФорма, Истина);
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаНайтиСсылкиНаОбъектВыгрузки(Команда)
	
	НайтиСсылкиНаОбъектВыгрузки();
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаОбъектБазыВыгрузкаОтправитьВРедакторXML(Команда)
	
	ОбъектБазыРедакторXML = ОбъектБазыВыгрузка;
	
	ОбъектБазыРедакторXMLОбновитьДанные();
	
	Элементы.СтраницыФормы.ТекущаяСтраница = Элементы.СтраницаРедакторXML;
	
КонецПроцедуры

&НаКлиенте
Процедура КомандаОбъектБазыЗагрузкаОтправитьВРедакторXML(Команда)
	
	ОбъектБазыРедакторXML = ОбъектБазыЗагрузка;
	
	ОбъектБазыРедакторXMLОбновитьДанные();
	
	Элементы.СтраницыФормы.ТекущаяСтраница = Элементы.СтраницаРедакторXML;
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область Процедуры

&НаКлиенте
Процедура ЗагрузитьДанныеОбъектаXMLНаКлиенте()
	
	ДиалогВыбораФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	ДиалогВыбораФайла.МножественныйВыбор = Ложь;
	ДиалогВыбораФайла.Заголовок = "Выберите файл";
	ДиалогВыбораФайла.Расширение = РасширениеПоУмолчаниюДиалогаВыбора;
	ДиалогВыбораФайла.Фильтр = "XML файл (*.xml)|*.xml|Zip-архив (*.zip)|*.zip";
	
	ДиалогВыбораФайла.Показать(Новый ОписаниеОповещения("ЗагрузитьДанныеОбъектаXMLНаКлиентеПослеЗакрытияДилога", ЭтаФорма));
	
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьДанныеОбъектаXMLНаКлиентеПослеЗакрытияДилога(ВыбФайлы, ДополнительныеПараметры) Экспорт
	
	#Область Предусловия
	
	Если ВыбФайлы = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если ВыбФайлы.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ИмяФайла = ВыбФайлы[0];
	
	ВыбФайл = Новый Файл(ИмяФайла);
	РасширениеФайла = ВыбФайл.Расширение;
	РасширениеПоУмолчаниюДиалогаВыбора = РасширениеФайла;
	
	АдресФайла = ПоместитьВоВременноеХранилище(Новый ДвоичныеДанные(ИмяФайла), УникальныйИдентификатор);
	
	ЗагрузитьДанныеОбъектаXML(АдресФайла, РасширениеФайла);
	
	УстановитьСвойстваЭлементовФормы(ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьДанныеОбъектаXMLНаКлиенте()
	
	#Область ПередВыполнением
	
	ВсеОбъектыДляВыгрузки.Очистить();
	
	#КонецОбласти
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ОбъектБазыВыгрузка) Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ДиалогВыбораФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Сохранение);
	ДиалогВыбораФайла.МножественныйВыбор = Ложь;
	ДиалогВыбораФайла.Заголовок = "Укажите имя файла для выгрузки данных объекта";
	
	ПолноеИмяФайла = ПолноеИмяФайлаПоДаннымОбъекта(ОбъектБазыВыгрузка);
	ДиалогВыбораФайла.ПолноеИмяФайла = ПолноеИмяФайла;
	
	Если ВыгружатьДвиженияДокумента Или ВыгружатьОбъектыПоСсылкам Или ВыгружатьСсылкиНаОбъект Тогда
		ДиалогВыбораФайла.Фильтр = "Zip-архив (*.zip)|*.zip";
	Иначе
		ДиалогВыбораФайла.Фильтр = "XML файл (*.xml)|*.xml";
	КонецЕсли;
	
	ДиалогВыбораФайла.Показать(Новый ОписаниеОповещения("ВыгрузитьДанныеОбъектаXMLНаКлиентеПослеЗакрытияДилога", ЭтаФорма));
	
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьДанныеОбъектаXMLНаКлиентеПослеЗакрытияДилога(ВыбранныеФайлы, ДополнительныеПараметры) Экспорт
	
	#Область Предусловия
	
	Если ВыбранныеФайлы = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если ВыбранныеФайлы.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ИмяФайлаДанных = ВыбранныеФайлы[0];
	
	АдресВременногоХранилища = Неопределено;
	
	// Выполнить выгрузку данных объекта, объектов по ссылкам, связанных объектов.
	ВыгрузитьДанныеОбъектаXML(АдресВременногоХранилища);
	
	Если ЗначениеЗаполнено(АдресВременногоХранилища) Тогда
		
		ДанныеФайла = ПолучитьИзВременногоХранилища(АдресВременногоХранилища);
		
		Попытка
			
			ДанныеФайла.Записать(ИмяФайлаДанных);
			
			ПоказатьОповещениеПользователя(
				"Выгрузка выполнена", 
				Новый ОписаниеОповещения("ВыгрузитьДанныеОбъектаXMLПриНажатии", ЭтаФорма, Новый Структура("ИмяФайлаДанных", ИмяФайлаДанных)), 
				ИмяФайлаДанных, Элементы.КартинкаИнформация.Картинка, СтатусОповещенияПользователя.Информация
			);
			
		Исключение
			//
		КонецПопытки;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьДанныеОбъектаXMLПриНажатии(ДпПараметры) Экспорт
	
	#Область Предусловия
	
	Если ДпПараметры = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ИмяФайлаДанных = ДпПараметры.ИмяФайлаДанных;
	
	Если Не ЗначениеЗаполнено(ИмяФайлаДанных) Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ИмяФайлаДанных = ДпПараметры.ИмяФайлаДанных;
	
	ЗапуститьПриложение(ИмяФайлаДанных);
	
КонецПроцедуры

&НаСервере
Процедура ЗагрузитьДанныеОбъектаXMLИзРедактора()
	
	ЧтениеXML = Новый ЧтениеXML;
	ЧтениеXML.УстановитьСтроку(ДанныеXML);
	
	Попытка
		ДанныеОбъектаБазы = ПрочитатьXML(ЧтениеXML);
	Исключение
		ТекстОшибки = ОписаниеОшибки();
		Сообщить(ТекстОшибки);
		Возврат;
	КонецПопытки;
	
	ДанныеОбъектаБазы.ОбменДанными.Загрузка = Истина;
	ДанныеОбъектаБазы.Записать();
	
	ОбъектБазыРедакторXML = ДанныеОбъектаБазы.Ссылка;
	
КонецПроцедуры

&НаСервере
Процедура ЗагрузитьДанныеОбъектаXML(АдресФайла, РасширениеФайла)
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(АдресФайла) Тогда
		Возврат;
	КонецЕсли;
	
	ДанныеФайла = ПолучитьИзВременногоХранилища(АдресФайла);
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла(РасширениеФайла);
	
	Попытка
		ДанныеФайла.Записать(ИмяВременногоФайла);
	Исключение
		Возврат;
	КонецПопытки;
	
	#КонецОбласти
	
	Если ВРег(РасширениеФайла) = ВРег(".xml") Тогда
		
		ТекстовыйДокумент = Новый ТекстовыйДокумент;
		ТекстовыйДокумент.Прочитать(ИмяВременногоФайла);
		
		ст_XML = ТекстовыйДокумент.ПолучитьТекст();
		
		//
		
		ОбъектБазы = Неопределено;
		
		ЧтениеXML = Новый ЧтениеXML;
		ЧтениеXML.УстановитьСтроку(ст_XML);
		
		Попытка
			ДанныеОбъектаБазы = ПрочитатьXML(ЧтениеXML);
		Исключение
			ТекстОшибки = ОписаниеОшибки();
			Сообщить(ТекстОшибки);
			Возврат;
		КонецПопытки;
		
		ДанныеОбъектаБазы.ОбменДанными.Загрузка = Истина;
		ДанныеОбъектаБазы.Записать();
		
		ОбъектБазыЗагрузка = ДанныеОбъектаБазы.Ссылка;
		
	ИначеЕсли ВРег(РасширениеФайла) = ВРег(".zip") Тогда
		
		ИмяВременногоКаталога = ПолучитьИмяВременногоФайла("");
		СоздатьКаталог(ИмяВременногоКаталога);
		
		ЧтениеZipФайла = Новый ЧтениеZipФайла(ИмяВременногоФайла);
		ЧтениеZipФайла.ИзвлечьВсе(ИмяВременногоКаталога, РежимВосстановленияПутейФайловZIP.Восстанавливать);
		
		ФайлыXML = НайтиФайлы(ИмяВременногоКаталога, "*.xml");
		
		Для каждого ФайлXML Из ФайлыXML Цикл
			
			ЧтениеXML = Новый ЧтениеXML;
			ЧтениеXML.ОткрытьФайл(ФайлXML.ПолноеИмя);
			
			Попытка
				ДанныеОбъектаБазы = ПрочитатьXML(ЧтениеXML);
			Исключение
				ТекстОшибки = ОписаниеОшибки();
				Сообщить(ТекстОшибки);
				Возврат;
			КонецПопытки;
			
			ЧтениеXML.Закрыть();
			
			ДанныеОбъектаБазы.ОбменДанными.Загрузка = Истина;
			ДанныеОбъектаБазы.Записать();
			
			Если СтрНайти(ФайлXML.ПолноеИмя, "$_ОбъектБазы_$") > 0 Тогда
				ОбъектБазыЗагрузка = ДанныеОбъектаБазы.Ссылка;
			КонецЕсли;
			
		КонецЦикла;
		
		УдалитьФайлы(ИмяВременногоКаталога);
		
	КонецЕсли;
	
	//
	
	УдалитьФайлы(ИмяВременногоФайла);
	
КонецПроцедуры

&НаСервере
Функция ТребуетсяВыгрузкаОбъекта(СсылкаНаЭлемент)
	
	эл_ВсеОбъектыДляВыгрузки = ВсеОбъектыДляВыгрузки.НайтиПоЗначению(СсылкаНаЭлемент);
	
	Если Не (эл_ВсеОбъектыДляВыгрузки = Неопределено) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Возврат Истина;
	
КонецФункции

&НаСервере
Процедура ВыгрузитьДанныеОбъектаXMLВФайл(СсылкаНаЭлемент, ИмяВременногоФайла, ВыгрузкаВыполнена)
	
	#Область ПередВыполнением
	
	ВыгрузкаВыполнена = Ложь;
	
	#КонецОбласти
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(СсылкаНаЭлемент) Тогда
		Возврат;
	КонецЕсли;
	
	ТребуетсяВыгрузка = ТребуетсяВыгрузкаОбъекта(СсылкаНаЭлемент);
	
	Если Не ТребуетсяВыгрузка Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ОбъектБазыДляЧтения = СсылкаНаЭлемент.ПолучитьОбъект();
	
	ЗаписьXML = Новый ЗаписьXML;
	ЗаписьXML.ОткрытьФайл(ИмяВременногоФайла);
	ЗаписатьXML(ЗаписьXML, ОбъектБазыДляЧтения);
	ЗаписьXML.Закрыть();
	
	ВсеОбъектыДляВыгрузки.Добавить(СсылкаНаЭлемент);
	
	ВыгрузкаВыполнена = Истина;
	
КонецПроцедуры

&НаСервере
Процедура ВыгрузитьДанныеОбъектаXML(АдресВременногоХранилища)
	
	Перем ДанныеДвижений;
	Перем ДанныеСвязанныхОбъектов;
	Перем ДанныеСсылокНаОбъект;
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ОбъектБазыВыгрузка) Тогда
		Возврат;
	КонецЕсли;
	
	ИмяВременногоФайлаДанныхОбъекта = ИмяФайлаXMLДляВыгрузкиЭлементаБазы(ОбъектБазыВыгрузка.Ссылка, "$_ОбъектБазы_$");
	
	Если Не ЗначениеЗаполнено(ИмяВременногоФайлаДанныхОбъекта) Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ВыгрузкаВыполнена = Ложь;
	ВыгрузитьДанныеОбъектаXMLВФайл(ОбъектБазыВыгрузка, ИмяВременногоФайлаДанныхОбъекта, ВыгрузкаВыполнена);
	
	Если Не ВыгрузкаВыполнена Тогда
		ВызватьИсключение("Не удалось выгрузить данные объекта в XML.");
	КонецЕсли;
	
	//
	
	ИмяВременногоФайлаZip = "";
	
	Если ВыгружатьДвиженияДокумента Тогда
		
		Если Не ЗначениеЗаполнено(ИмяВременногоФайлаZip) Тогда
			
			ИмяВременногоФайлаZip = ПолучитьИмяВременногоФайла("zip");
			
			ZipФайл = Новый ЗаписьZipФайла(ИмяВременногоФайлаZip, "", "", МетодСжатияZIP.Сжатие, УровеньСжатияZIP.Оптимальный, МетодШифрованияZIP.Zip20);
			ZipФайл.Добавить(ИмяВременногоФайлаДанныхОбъекта);
			
		КонецЕсли;
		
		// Выгрузить даные движений документа.
		ДанныеДвижений = Неопределено;
		ВыгрузитьДвиженияДокумента(ДанныеДвижений);
		
		Для каждого ИмяФайла Из ДанныеДвижений Цикл
			ZipФайл.Добавить(ИмяФайла);
		КонецЦикла;
		
	КонецЕсли;
	
	Если ВыгружатьОбъектыПоСсылкам Тогда
		
		Если Не ЗначениеЗаполнено(ИмяВременногоФайлаZip) Тогда
			
			ИмяВременногоФайлаZip = ПолучитьИмяВременногоФайла("zip");
			
			ZipФайл = Новый ЗаписьZipФайла(ИмяВременногоФайлаZip, "", "", МетодСжатияZIP.Сжатие, УровеньСжатияZIP.Оптимальный, МетодШифрованияZIP.Zip20);
			ZipФайл.Добавить(ИмяВременногоФайлаДанныхОбъекта);
			
		КонецЕсли;
		
		// Выгрузить связанные объекты.
		ДанныеСвязанныхОбъектов = Неопределено;
		ВыгрузитьЭлементыПоСсылкам(ОбъектБазыВыгрузка, ДанныеСвязанныхОбъектов);
		
		Для каждого ИмяФайла Из ДанныеСвязанныхОбъектов Цикл
			ZipФайл.Добавить(ИмяФайла);
		КонецЦикла;
		
	КонецЕсли;
	
	Если ВыгружатьСсылкиНаОбъект Тогда
		
		Если Не ЗначениеЗаполнено(ИмяВременногоФайлаZip) Тогда
			
			ИмяВременногоФайлаZip = ПолучитьИмяВременногоФайла("zip");
			
			ZipФайл = Новый ЗаписьZipФайла(ИмяВременногоФайлаZip, "", "", МетодСжатияZIP.Сжатие, УровеньСжатияZIP.Оптимальный, МетодШифрованияZIP.Zip20);
			ZipФайл.Добавить(ИмяВременногоФайлаДанныхОбъекта);
			
		КонецЕсли;
		
		// Выгрузить ссылки на объект.
		ДанныеСсылокНаОбъект = Неопределено;
		ВыгрузитьНайденныеСсылкиНаОбъект(ДанныеСсылокНаОбъект);
		
		Для каждого ИмяФайла Из ДанныеСсылокНаОбъект Цикл
			ZipФайл.Добавить(ИмяФайла);
		КонецЦикла;
		
	КонецЕсли;
	
	//
	
	Если ЗначениеЗаполнено(ИмяВременногоФайлаZip) Тогда
		
		ZipФайл.Записать();
		
		УдалитьФайлыПоСписку(ДанныеСвязанныхОбъектов);
		УдалитьФайлыПоСписку(ДанныеДвижений);
		УдалитьФайлыПоСписку(ДанныеСсылокНаОбъект);
		
		ДанныеФайла = Новый ДвоичныеДанные(ИмяВременногоФайлаZip);
		
	Иначе
		ДанныеФайла = Новый ДвоичныеДанные(ИмяВременногоФайлаДанныхОбъекта);
	КонецЕсли;
	
	//
	
	АдресВременногоХранилища = "";
	
	Попытка
		АдресВременногоХранилища = ПоместитьВоВременноеХранилище(ДанныеФайла, УникальныйИдентификатор);
	Исключение
		//
	КонецПопытки;
	
	//
	
	УдалитьФайлы(ИмяВременногоФайлаДанныхОбъекта);
	
	Если ЗначениеЗаполнено(ИмяВременногоФайлаZip) Тогда
		УдалитьФайлы(ИмяВременногоФайлаZip);
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура УдалитьФайлыПоСписку(МассивИменФайлов)
	
	#Область Предусловия
	
	Если (МассивИменФайлов = Неопределено) Тогда
		Возврат;
	КонецЕсли;
	
	Если (МассивИменФайлов.Количество() = 0) Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	Для каждого ИмяФайла Из МассивИменФайлов Цикл
		
		Если Не ЗначениеЗаполнено(ИмяФайла) Тогда
			Продолжить;
		КонецЕсли;
		
		УдалитьФайлы(ИмяФайла);
		
	КонецЦикла;
	
КонецПроцедуры

&НаСервере
Процедура ОбъектБазыРедакторXMLОбновитьДанные()
	
	ДанныеXML = "";
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ОбъектБазыРедакторXML) Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ОбъектБазыДляЧтения = ОбъектБазыРедакторXML.ПолучитьОбъект();
	
	ЗаписьXML = Новый ЗаписьXML;
	ЗаписьXML.УстановитьСтроку();
	ЗаписатьXML(ЗаписьXML, ОбъектБазыДляЧтения);
	
	ДанныеXML = ЗаписьXML.Закрыть();
	
КонецПроцедуры

&НаСервере
Процедура ОпределитьТипОбъекта(ОбъектБазы, ЭтоДокумент, ЭтоСправочник)
	
	ЭтоДокумент   = Ложь;
	ЭтоСправочник = Ложь;
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ОбъектБазы) Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	ОбъектБазыМетаданные = ОбъектБазы.Метаданные();
	
	Навигатор = ЭтаОбработка();
	
	ЭтоДокумент   = Навигатор.ЭтоДокумент(ОбъектБазыМетаданные);
	ЭтоСправочник = Навигатор.ЭтоСправочник(ОбъектБазыМетаданные);
	
КонецПроцедуры

&НаСервере
Процедура ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, СсылкаНаЭлемент)
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(СсылкаНаЭлемент) Тогда
		Возврат;
	КонецЕсли;
	
	Попытка
		СсылкаНаЭлементМД = СсылкаНаЭлемент.Метаданные();
	Исключение
		Возврат;
	КонецПопытки;
	
	Навигатор = ЭтаОбработка();
	
	Если Навигатор.ЭтоПеречисление(СсылкаНаЭлементМД) Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	Если Не (СвязанныеОбъекты.Найти(СсылкаНаЭлемент) = Неопределено) Тогда
		Возврат;
	КонецЕсли;
	
	СвязанныеОбъекты.Добавить(СсылкаНаЭлемент);
	
КонецПроцедуры

&НаСервере
Процедура ВыгрузитьЭлементыПоСсылкам(ОбъектБазы, ДанныеОбъектовПоСсылкам)
	
	#Область ПередВыполнением
	
	ДанныеОбъектовПоСсылкам = Новый Массив;
	
	#КонецОбласти
	
	#Область Предусловия
	
	ЭлементыПоСсылкам = ЭлементыПоСсылкамСвойствОбъектаБазы(ОбъектБазы);
	
	Если ЭлементыПоСсылкам.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	Навигатор = ЭтаОбработка();
	
	ДанныеОбъектовПоСсылкам = Новый Массив;
	
	Для каждого ЭлементПоСсылке Из ЭлементыПоСсылкам Цикл
		
		#Область Предусловия
		
		Если Не ЗначениеЗаполнено(ЭлементПоСсылке) Тогда
			Продолжить;
		КонецЕсли;
		
		ИмяВременногоФайла = ИмяФайлаXMLДляВыгрузкиЭлементаБазы(ЭлементПоСсылке);
		
		Если Не ЗначениеЗаполнено(ИмяВременногоФайла) Тогда
			Продолжить;
		КонецЕсли;
		
		// Предопределенные элементы не выгружаем, иначе они дублируются при загрузке.
		
		ЭтоПредопределенный = Навигатор.ЭтоПредопределенныйЭлемент(ЭлементПоСсылке);
		
		Если ЭтоПредопределенный Тогда
			Продолжить;
		КонецЕсли;
		
		#КонецОбласти
		
		ВыгрузкаВыполнена = Ложь;
		ВыгрузитьДанныеОбъектаXMLВФайл(ЭлементПоСсылке, ИмяВременногоФайла, ВыгрузкаВыполнена);
		
		Если ВыгрузкаВыполнена Тогда
			ДанныеОбъектовПоСсылкам.Добавить(ИмяВременногоФайла);
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

&НаСервере
Процедура ВыгрузитьНайденныеСсылкиНаОбъект(ДанныеСсылокНаОбъект)
	
	#Область ПередВыполнением
	
	ДанныеСсылокНаОбъект = Новый Массив;
	
	#КонецОбласти
	
	#Область Предусловия
	
	Если (ТаблицаНайденныхСсылок.Количество() = 0) Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	Навигатор = ЭтаОбработка();
	
	Для каждого стр_ТаблицаНайденныхСсылок Из ТаблицаНайденныхСсылок Цикл
		
		#Область Предусловия
		
		Если Не стр_ТаблицаНайденныхСсылок.Пометка Тогда
			Продолжить;
		КонецЕсли;
		
		Если Не ЗначениеЗаполнено(стр_ТаблицаНайденныхСсылок.Данные) Тогда
			Продолжить;
		КонецЕсли;
		
		ИмяВременногоФайла = ИмяФайлаXMLДляВыгрузкиЭлементаБазы(стр_ТаблицаНайденныхСсылок.Данные);
		
		Если Не ЗначениеЗаполнено(ИмяВременногоФайла) Тогда
			Продолжить;
		КонецЕсли;
		
		// Предопределенные элементы не выгружаем, иначе они дублируются при загрузке.
		
		ЭтоПредопределенный = Навигатор.ЭтоПредопределенныйЭлемент(стр_ТаблицаНайденныхСсылок.Данные);
		
		Если ЭтоПредопределенный Тогда
			Продолжить;
		КонецЕсли;
		
		#КонецОбласти
		
		ВыгрузкаВыполнена = Ложь;
		
		ЭтоСтрокаКлючаЗаписи = ЭтоСтрокаКлючаЗаписиРегистра(стр_ТаблицаНайденныхСсылок.ИмяТипа);
		
		Если ЭтоСтрокаКлючаЗаписи Тогда
			ВыгрузитьДанныеЗаписиРегистраВФайлXML(стр_ТаблицаНайденныхСсылок.Данные, ИмяВременногоФайла, ВыгрузкаВыполнена);
		Иначе
			ВыгрузитьДанныеОбъектаXMLВФайл(стр_ТаблицаНайденныхСсылок.Данные, ИмяВременногоФайла, ВыгрузкаВыполнена);
		КонецЕсли;
		
		Если ВыгрузкаВыполнена Тогда
			ДанныеСсылокНаОбъект.Добавить(ИмяВременногоФайла);
		КонецЕсли;
		
		Если стр_ТаблицаНайденныхСсылок.ВыгружатьПоСсылкам И Не ЭтоСтрокаКлючаЗаписи Тогда // Временно
			ВыгрузитьЭлементыПоСсылкам(стр_ТаблицаНайденныхСсылок.Данные, ДанныеСсылокНаОбъект);
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

&НаСервере
Процедура ВыгрузитьДанныеЗаписиРегистраВФайлXML(Данные, ИмяВременногоФайла, ВыгрузкаВыполнена)
	
	#Область ПередВыполнением
	
	ВыгрузкаВыполнена = Ложь;
	
	#КонецОбласти
	
	НаборЗаписей = НаборИзЗаписиРегистраСведений(Данные);
	
	ЗаписьXML = Новый ЗаписьXML;
	ЗаписьXML.ОткрытьФайл(ИмяВременногоФайла);
	ЗаписатьXML(ЗаписьXML, НаборЗаписей);
	ЗаписьXML.Закрыть();
	
	ВыгрузкаВыполнена = Истина;
	
КонецПроцедуры

&НаСервере
Процедура ВыгрузитьДвиженияДокумента(ДанныеДвижений)
	
	#Область ПередВыполнением
	
	ДанныеДвижений = Новый Массив;
	
	#КонецОбласти
	
	ДанныеОбъекта = ОбъектБазыВыгрузка.ПолучитьОбъект();
	
	Для каждого НаборЗаписей Из ДанныеОбъекта.Движения Цикл
		
		#Область Предусловия
		
		ИмяВременногоФайла = ИмяФайлаXMLДляВыгрузкиБлокаДвижений(НаборЗаписей.Метаданные());
		
		Если Не ЗначениеЗаполнено(ИмяВременногоФайла) Тогда
			Продолжить;
		КонецЕсли;
		
		#КонецОбласти
		
		НаборЗаписей.Прочитать();
		
		ЗаписьXML = Новый ЗаписьXML;
		ЗаписьXML.ОткрытьФайл(ИмяВременногоФайла);
		ЗаписатьXML(ЗаписьXML, НаборЗаписей);
		ЗаписьXML.Закрыть();
		
		ДанныеДвижений.Добавить(ИмяВременногоФайла);
		
	КонецЦикла;
	
КонецПроцедуры

&НаСервере
Процедура НайтиСсылкиНаОбъектВыгрузки()
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ОбъектБазыВыгрузка) Тогда
		Возврат;
	КонецЕсли;
	
	#КонецОбласти
	
	Навигатор = ЭтаОбработка();
	
	МассивСсылок = Новый Массив;
	МассивСсылок.Добавить(ОбъектБазыВыгрузка);
	
	СсылкиНаНайденные = НайтиПоСсылкам(МассивСсылок);
	
	тз_ТаблицаНайденныхСсылок = РеквизитФормыВЗначение("ТаблицаНайденныхСсылок");
	тз_ТаблицаНайденныхСсылок.Очистить();
	
	Для каждого стр_СсылкиНаНайденные Из СсылкиНаНайденные Цикл
		
		стр_ТаблицаНайденныхСсылок = тз_ТаблицаНайденныхСсылок.Добавить();
		ЗаполнитьЗначенияСвойств(стр_ТаблицаНайденныхСсылок, стр_СсылкиНаНайденные);
		
		ИмяТипа = Навигатор.ПредставлениеТипаОбъектаКонфигурации(стр_СсылкиНаНайденные.Данные);
		стр_ТаблицаНайденныхСсылок.ИмяТипа = ИмяТипа;
		
		стр_ТаблицаНайденныхСсылок.Представление = ПредставлениеНайденнойСсылки(стр_СсылкиНаНайденные.Данные);
		
	КонецЦикла;
	
	ЗначениеВРеквизитФормы(тз_ТаблицаНайденныхСсылок, "ТаблицаНайденныхСсылок");
	
	Элементы.ТаблицаНайденныхСсылокПредставление.ТекстПодвала = "Найдено ссылок: " + тз_ТаблицаНайденныхСсылок.Количество();
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьСвойстваЭлементовФормы(Форма)
	
	Форма.Элементы.ВыгружатьДвиженияДокумента.Видимость   = Форма.ОбъектБазыВыгрузкаЭтоДокумент;
	Форма.Элементы.ГруппаТаблицаНайденныхСсылок.Видимость = Форма.ВыгружатьСсылкиНаОбъект;
	
КонецПроцедуры

#КонецОбласти

#Область Функции

&НаСервере
Функция НаборИзЗаписиРегистраСведений(ЗаписьРегистраСведений)
	
	Результат = Неопределено; // Набор записей регистра сведений
	ПустойРезультат = Неопределено;
	
	#Область Предусловия
	
	Если ЗаписьРегистраСведений = Неопределено Тогда
		Возврат ПустойРезультат;
	КонецЕсли; 
	
	#КонецОбласти
	
	МетаданныеРегистра = ЗаписьРегистраСведений.Метаданные();
	
	НаборЗаписей = РегистрыСведений[МетаданныеРегистра.Имя].СоздатьНаборЗаписей();
	
	Для Каждого Измерение Из МетаданныеРегистра.Измерения Цикл
		
	КонецЦикла; 
	
	Если Не (МетаданныеРегистра.ПериодичностьРегистраСведений = Метаданные.СвойстваОбъектов.ПериодичностьРегистраСведений.Непериодический) Тогда
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

&НаСервере
Функция ЭтоСтрокаКлючаЗаписиРегистра(ИмяТипа)
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ИмяТипа) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	#КонецОбласти
	
	Навигатор = ЭтаОбработка();
	
	ЧастиСтроки = Навигатор.РазложитьСтрокуВМассивПодстрок(ИмяТипа, ".");
	ОпределительТипа = ЧастиСтроки[0];
	
	Если Не (ОпределительТипа = "РегистрСведений" Или ОпределительТипа = "РегистрНакопления" Или ОпределительТипа = "РегистрБухгалтерии" Или ОпределительТипа = "РегистрРасчета") Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Возврат Истина;
	
КонецФункции

&НаСервере
Функция ПолноеИмяФормыОбработки(ИмяТекущейФормы, ИмяФормыОбработки)
	
	Результат = ЭтаОбработка().ПолноеИмяФормыОбработки(ИмяТекущейФормы, ИмяФормыОбработки);
	
	Возврат Результат;
	
КонецФункции

&НаСервере
Функция ЭтаОбработка()
	
	Возврат РеквизитФормыВЗначение("Объект");
	
КонецФункции

&НаСервере
Функция ЭлементыПоСсылкамСвойствОбъектаБазы(ОбъектБазы)
	
	Результат = Новый Массив;
	ПустойРезультат = Новый Массив;
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ОбъектБазы) Тогда
		Возврат ПустойРезультат;
	КонецЕсли;
	
	#КонецОбласти
	
	ЭтоДокумент = Ложь;
	ЭтоСправочник = Ложь;
	
	ОпределитьТипОбъекта(ОбъектБазы, ЭтоДокумент, ЭтоСправочник);
	
	//
	
	СвязанныеОбъекты = Новый Массив;
	
	ОбъектБазыМетаданные = ОбъектБазы.Метаданные();
	
	Для каждого СтандартныйРеквизит Из ОбъектБазыМетаданные.СтандартныеРеквизиты Цикл
		ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, ОбъектБазы[СтандартныйРеквизит.Имя]);
	КонецЦикла;
	
	Для каждого Реквизит Из ОбъектБазыМетаданные.Реквизиты Цикл
		ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, ОбъектБазы[Реквизит.Имя]);
	КонецЦикла;
	
	Для каждого ТабличнаяЧасть Из ОбъектБазыМетаданные.ТабличныеЧасти Цикл
		
		Если ОбъектБазы[ТабличнаяЧасть.Имя].Количество() = 0 Тогда
			Продолжить;
		КонецЕсли;
		
		Для каждого стр_ТаблЧасть Из ОбъектБазы[ТабличнаяЧасть.Имя] Цикл
			
			Для каждого РеквизитТабличнойЧасти Из ТабличнаяЧасть.Реквизиты Цикл
				ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, стр_ТаблЧасть[РеквизитТабличнойЧасти.Имя]);
			КонецЦикла;
			
		КонецЦикла;
		
	КонецЦикла;
	
	//
	
	Навигатор = ЭтаОбработка();
	
	Если ЭтоДокумент Тогда
		
		ДанныеОбъекта = ОбъектБазы.ПолучитьОбъект();
		
		Для каждого НаборЗаписей Из ДанныеОбъекта.Движения Цикл
			
			НаборЗаписей.Прочитать();
			
			Если НаборЗаписей.Количество() = 0 Тогда
				Продолжить;
			КонецЕсли;
			
			НаборЗаписейМетаданные = НаборЗаписей.Метаданные();
			
			ЭтоРегистрБухгалтерии = Навигатор.ЭтоРегистрБухгалтерии(НаборЗаписейМетаданные);
			ЭтоРегистрНакопления  = Навигатор.ЭтоРегистрНакопления(НаборЗаписейМетаданные);
			ЭтоРегистрСведений    = Навигатор.ЭтоРегистрСведений(НаборЗаписейМетаданные);
			
			Для каждого Запись Из НаборЗаписей Цикл
				
				Для каждого Измерение Из НаборЗаписейМетаданные.Измерения Цикл
					
					Если ЭтоРегистрБухгалтерии Тогда
						
						Если НаборЗаписейМетаданные.Корреспонденция И Не Измерение.Балансовый Тогда
							ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, Запись[Измерение.Имя + "Дт"]);
							ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, Запись[Измерение.Имя + "Кт"]);
						Иначе
							ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, Запись[Измерение.Имя]);
						КонецЕсли;
						
					Иначе
						ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, Запись[Измерение.Имя]);
					КонецЕсли;
					
				КонецЦикла;
				
				Для каждого Реквизит Из НаборЗаписейМетаданные.Реквизиты Цикл
					ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, Запись[Реквизит.Имя]);
				КонецЦикла;
				
				Если ЭтоРегистрСведений Тогда
					
					Для каждого Ресурс Из НаборЗаписейМетаданные.Ресурсы Цикл
						ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, Запись[Ресурс.Имя]);
					КонецЦикла;
					
				КонецЕсли;
				
				// Субконто
				
				Если ЭтоРегистрБухгалтерии Тогда
					
					Если НаборЗаписейМетаданные.Корреспонденция Тогда
						
						Для каждого КлючЗначение Из Запись.СубконтоДт Цикл
							ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, КлючЗначение.Значение);
						КонецЦикла;
						
						Для каждого КлючЗначение Из Запись.СубконтоКт Цикл
							ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, КлючЗначение.Значение);
						КонецЦикла;
						
					Иначе
						Для каждого КлючЗначение Из Запись.Субконто Цикл
							ДобавитьСсылкуНаСвязанныйЭлемент(СвязанныеОбъекты, КлючЗначение.Значение);
						КонецЦикла;
					КонецЕсли;
					
				КонецЕсли;
				
			КонецЦикла;
			
		КонецЦикла;
		
	КонецЕсли;
	
	//
	
	Результат = СвязанныеОбъекты;
	Возврат Результат;
	
КонецФункции

&НаСервере
Функция ИмяФайлаXMLДляВыгрузкиБлокаДвижений(НаборЗаписейМД)
	
	Результат = "";
	ПустойРезультат = "";
	
	#Область Предусловия
	
	Если НаборЗаписейМД = Неопределено Тогда
		Возврат ПустойРезультат;
	КонецЕсли;
	
	#КонецОбласти
	
	//
	
	ИмяФайлаДляВыгрузки = "";
	
	СсылкаНаОбъектИД = Строка(ОбъектБазыВыгрузка.УникальныйИдентификатор());
	
	ИмяВрФайла = ПолучитьИмяВременногоФайла("xml");
	Файл = Новый Файл(ИмяВрФайла);
	
	КаталогВременныхФайлов = КаталогВременныхФайлов();
	
	Навигатор = ЭтаОбработка();
	ИмяТипа = Навигатор.ИмяТипаОбъектаМетаданных(НаборЗаписейМД);
	
	ИмяФайлаДляВыгрузки = Навигатор.ПодставитьПараметрыВСТроку(
		"%1\%2_%3_%4_%5_%6", 
		КаталогВременныхФайлов, 
		ИмяТипа, 
		НаборЗаписейМД.Имя, 
		СсылкаНаОбъектИД,
		Файл.ИмяБезРасширения,
		Файл.Расширение
	);
	
	//
	
	Результат = ИмяФайлаДляВыгрузки;
	Возврат Результат;
	
КонецФункции

&НаСервере
Функция ПолноеИмяФайлаПоДаннымОбъекта(СсылкаНаОбъект)
	
	Результат = "";
	ПустойРезультат = "";
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(СсылкаНаОбъект) Тогда
		Возврат ПустойРезультат;
	КонецЕсли;
	
	Попытка
		СсылкаНаОбъектМД = СсылкаНаОбъект.Метаданные();
	Исключение
		Возврат ПустойРезультат;
	КонецПопытки;
	
	#КонецОбласти
	
	ПолноеИмяФайла = "";
	
	Навигатор = ЭтаОбработка();
	
	ИмяТипа = Навигатор.ИмяТипаОбъектаМетаданных(СсылкаНаОбъектМД); // "Документ"
	ИмяОбъекта = СсылкаНаОбъектМД.Имя; // "АвансовыйОтчет"
	ВерсияДанных = СсылкаНаОбъект.ВерсияДанных; // "AAAAAAACOCA="
	
	Если ИмяТипа = "Документ" Тогда
		ЗначенияРеквизитов = Навигатор.ЗначенияРеквизитовОбъекта(СсылкаНаОбъект, "Номер, Дата");
		ПолноеИмяФайла = Навигатор.ПодставитьПараметрыВСтроку("%1_%2_%3_%4_%5", ИмяТипа, ИмяОбъекта, ЗначенияРеквизитов.Номер, Формат(ЗначенияРеквизитов.Дата, "ДФ=dd-MM-yyyy_HH-mm-ss"), ВерсияДанных);
	Иначе
		ЗначенияРеквизитов = Новый Структура("Код", "");
		Попытка
			ЗначенияРеквизитов = Навигатор.ЗначениеРеквизитаОбъекта(СсылкаНаОбъект, "Код");
		Исключение
			//
		КонецПопытки;
		ПолноеИмяФайла = Навигатор.ПодставитьПараметрыВСтроку("%1_%2_%3_%4", ИмяТипа, ИмяОбъекта, "Код", ВерсияДанных);
	КонецЕсли;
	
	//
	
	Результат = ПолноеИмяФайла;
	Возврат Результат;
	
КонецФункции

&НаСервере
Функция ИмяФайлаXMLДляВыгрузкиЭлементаБазы(ОбъектБазы, Определитель = "")
	
	Результат = "";
	ПустойРезультат = "";
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(ОбъектБазы) Тогда
		Возврат ПустойРезультат;
	КонецЕсли;
	
	Попытка
		СсылкаНаОбъектМД = ОбъектБазы.Метаданные();
	Исключение
		Возврат ПустойРезультат;
	КонецПопытки;
	
	#КонецОбласти
	
	Навигатор = ЭтаОбработка();
	
	ИмяФайлаДляВыгрузки = "";
	
	МетаданныеОбъекта = ОбъектБазы.Метаданные();
	
	Если Не (Навигатор.ЭтоРегистр(МетаданныеОбъекта)) Тогда
		ИдентификаторОбъекта = Строка(ОбъектБазы.УникальныйИдентификатор());
	Иначе
		ИдентификаторОбъекта = Новый УникальныйИдентификатор;
	КонецЕсли;
	
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла("xml");
	Файл = Новый Файл(ИмяВременногоФайла);
	
	КаталогВременныхФайлов = КаталогВременныхФайлов();
	
	ИмяТипа = Навигатор.ИмяТипаОбъектаМетаданных(МетаданныеОбъекта);
	
	Если ЗначениеЗаполнено(Определитель) Тогда
		
		ИмяФайлаДляВыгрузки = Навигатор.ПодставитьПараметрыВСТроку(
			"%1\%2_%3_%4_%5_%6_%7", 
			КаталогВременныхФайлов, 
			Определитель,
			ИмяТипа, 
			МетаданныеОбъекта.Имя, 
			ИдентификаторОбъекта, 
			Файл.ИмяБезРасширения,
			Файл.Расширение
		);
		
	Иначе
		
		ИмяФайлаДляВыгрузки = Навигатор.ПодставитьПараметрыВСТроку(
			"%1\%2_%3_%4_%5_%6", 
			КаталогВременныхФайлов, 
			ИмяТипа, 
			МетаданныеОбъекта.Имя, 
			ИдентификаторОбъекта, 
			Файл.ИмяБезРасширения,
			Файл.Расширение
		);
		
	КонецЕсли;
	
	Результат = ИмяФайлаДляВыгрузки;
	Возврат Результат;
	
КонецФункции

&НаСервере
Функция ПредставлениеНайденнойСсылки(НайденнаяСсылка)
	
	Результат = "";
	ПустойРезультат = "";
	
	#Область Предусловия
	
	Если Не ЗначениеЗаполнено(НайденнаяСсылка) Тогда
		Возврат ПустойРезультат;
	КонецЕсли;
	
	#КонецОбласти
	
	ПредставлениеСсылки = "";
	
	Навигатор = ЭтаОбработка();
	
	ИмяТипа = Навигатор.ПредставлениеТипаОбъектаКонфигурации(НайденнаяСсылка);
	
	ПредставлениеСсылки = Навигатор.ПодставитьПараметрыВСтроку("%1 (%2)", НайденнаяСсылка, ИмяТипа);
	
	//
	
	Результат = ПредставлениеСсылки;
	Возврат Результат;
	
КонецФункции

#КонецОбласти


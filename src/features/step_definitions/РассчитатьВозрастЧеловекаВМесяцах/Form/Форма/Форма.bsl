﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"УМеняЕстьДатаРожденияЧеловекаРавная(Парам01)","УМеняЕстьДатаРожденияЧеловекаРавная","Допустим У меня есть дата рождения человека равная 07.08.1985");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДатаНаКоторуюЯХочуПосчитатьВозрастВМесяцахРавный(Парам01)","ДатаНаКоторуюЯХочуПосчитатьВозрастВМесяцахРавный","И дата на которую я хочу посчитать возраст в месяцах равный 07.08.2016");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"РезультатБудетРавен(Парам01)","РезультатБудетРавен","Тогда Результат будет равен 372");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Допустим У меня есть дата рождения человека равная 07.08.1985
//@УМеняЕстьДатаРожденияЧеловекаРавная(Парам01)
Процедура УМеняЕстьДатаРожденияЧеловекаРавная(ДатаРождения) Экспорт
	КонтекстСохраняемый.Вставить("ДатаРождения", ДатаРождения);	
КонецПроцедуры

&НаКлиенте
//И дата на которую я хочу посчитать возраст в месяцах равный 07.08.2016
//@ДатаНаКоторуюЯХочуПосчитатьВозрастВМесяцахРавный(Парам01)
Процедура ДатаНаКоторуюЯХочуПосчитатьВозрастВМесяцахРавный(ДатаРасчета) Экспорт
		КонтекстСохраняемый.Вставить("ДатаРасчета", ДатаРасчета);	
	
КонецПроцедуры

&НаКлиенте
//Тогда Результат будет равен 372
//@РезультатБудетРавен(Парам01)
Процедура РезультатБудетРавен(ВозрастВМесяцах) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	Если НЕ КадровыеРасчеты.РассчитатьВозрастСотрудникаВМесяцахНаДату(КонтекстСохраняемый.ДатаРождения, КонтекстСохраняемый.ДатаРасчета) = ВозрастВМесяцах Тогда
		ВызватьИсключение "Ошибка расчета возраста в месяцах";
	КонецЕсли;
КонецПроцедуры

//окончание текста модуля
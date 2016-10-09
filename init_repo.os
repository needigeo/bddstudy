
Процедура ИнициализацияРепозитария()
     
    Перем ИмяПользователя, Email;
    Перем КаталогПрекомит, Приемник, КаталогРепозитария;
    КаталогПрекомит = "c:\repo\precommit1c\";
	КаталогРепозитария = ТекущийКаталог();
    ИмяПользователя = "needigeo";
    Email = "Dmitry.Neyolov@gmail.com";
	//Инициализация репозитария
    ЗапуститьПриложение("git init",,Истина);
    
    УстановитьТекущийКаталог(".git");
    
    ЗапуститьПриложение("git config --local user.name "+ИмяПользователя,,Истина);
    ЗапуститьПриложение("git config --local user.email "+Email,,Истина);
    ЗапуститьПриложение("git config	--local core.quotepath false",,Истина);
    ЗапуститьПриложение("git config --local merge.ours.driver true",,Истина);
    ЗапуститьПриложение("git config --local merge.ours.driver true",,Истина);
    ЗапуститьПриложение( "git remote add vanessa-bootstrap https://github.com/silverbulleters/vanessa-bootstrap.git",,Истина);   


	УстановитьТекущийКаталог("hooks");
    Приемник = ТекущийКаталог();

    СоздатьКаталог("ibService");
    ЗапуститьПриложение("xcopy "+КаталогПрекомит+"\ibService "+Приемник+"\ibService /Y /E /F",,Истина);
    ЗапуститьПриложение("xcopy "+КаталогПрекомит+"\pre-commit "+Приемник+" /Y /F",,Истина);
	СоздатьКаталог("v8Reader");
    ЗапуститьПриложение("xcopy "+КаталогПрекомит+"\v8Reader\V8Reader.epf "+Приемник+"\v8Reader\ /Y /F",,Истина);
    ЗапуститьПриложение("xcopy "+КаталогПрекомит+"\8files-extractor.os "+Приемник+" /Y /F",,Истина);
    СоздатьКаталог("tools");
    ЗапуститьПриложение("xcopy "+КаталогПрекомит+"\tools\v8unpack.exe "+Приемник+"\tools\ /Y /F",,Истина);
	УстановитьТекущийКаталог(КаталогРепозитария);
    ЗапуститьПриложение( "git pull --no-tags --no-commit vanessa-bootstrap master",,Истина);   

КонецПроцедуры

ИнициализацияРепозитария();
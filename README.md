# MeetRoomApp

1) ios приложение "Система бронирования переговорок" 
2) При запуске приложения, пользователя встречает экран авторизации. Данные пользователя сохраняются при помощи UserDefaults.
После авторизации идет экран с календарем по дням, при нажатии на кнопку плюсик можно добавть событие(в text field вводится название события, в datepicker выставляем дату начала(минимальное время бронирования 30 минут, максимальное 24 часа), во втором datePicker выставляется дата завершения события, после нажатия на кнопку save событие сохранится и отобразится на предыдущем экране, в левом верхнем углу есть кнопка, при нажатии на которую пользователь перемещается на экран с календарем по месяцам, нажатие на кнопку смайлик имитирует выход. Вторая вкладка Tab bar отображает экран, где отображается список переговорок, при нажатии на кнопку добавить переносимся на экран, где находится экран со списком новых переговорок, при нажатии на переговорку она добавится на предыдущий экран со списком. При нажатии на переговорку из списка переходим на следующий экран , где можно удалить переговорку на которую нажал пользователь. На 3 вкладке Tab bar экран со списком только авторизованного пользователя.
Системные требования (Swift)
Приложение находится на github в репозитории MeetRoomApp, после скачивания запустить файл MeetRoomApp.xcodeproj через программу xcode.


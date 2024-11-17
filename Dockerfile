# Инструкция, определеяющая на каком образе будет базироваться новый созданный образ докера
# Сначала проверяется наличие локально, потом в удаленном репозитории.
FROM node:18

# Инструкция, определяющая текущаю рабочую директорию в создаваемом образе
WORKDIR /app

COPY package.json /app

# Эта команда запускается при сборке образа
RUN npm install

# Инструкция для копирования файлов в создаваемый образ.
# Первая точка означает, что копироваться будут все файлы из текущей директори
# относительно расположения Dokerfile
# Вторая точка - директория в образе, в которую будут скопированы файлы.
# В данном случае относительно WORKDIR
COPY . .

# Вариант добавления переменной среды
# ENV PORT=3000

# Позволяет указать порт, на котором будет запущено приложение 
# EXPOSE 4200
EXPOSE $PORT


VOLUME [ "/app/data" ]

# Команда для запуска корневого файла пишется в указанном виде
# в JSON массиве строк
# Эта команда запускается при запуске образа
CMD ["node", "app.js"]
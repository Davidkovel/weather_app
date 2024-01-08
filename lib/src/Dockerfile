FROM cirrusci/flutter:stable

WORKDIR /app

# Скопируйте файл pubspec.yaml и pubspec.lock
COPY pubspec.yaml pubspec.lock ./

RUN flutter pub get

COPY . .

RUN flutter build apk --release

# Порт 80 -- Docker run
EXPOSE 80

CMD ["flutter", "run", "--release", "--flavor", "production"]

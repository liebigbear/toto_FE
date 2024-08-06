# 1단계: 빌드 스테이지
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16 AS build

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# 패키지 파일 복사 및 의존성 설치
COPY toto-fe/package.json toto-fe/package-lock.json ./
RUN npm install

# 소스 코드 복사 및 빌드 실행
COPY toto-fe .  # 소스 코드 및 모든 파일 복사
RUN npm run build  # Vite를 사용하여 프로덕션 빌드 실행

# 2단계: 프로덕션 스테이지
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# 빌드된 정적 파일 복사
COPY --from=build /usr/src/app/dist ./dist

# 정적 파일 제공을 위한 serve 패키지 설치
RUN npm install -g serve

# 포트 노출
EXPOSE 3000

# 정적 파일 제공 명령 실행
CMD ["serve", "-s", "dist"]

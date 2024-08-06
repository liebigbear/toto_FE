# 1단계: 빌드 스테이지
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16 AS build

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# 패키지 파일 복사 및 의존성 설치
COPY toto-fe/package.json toto-fe/package-lock.json ./
RUN npm install

# react-router-dom 설치
RUN npm install react-router-dom

# 소스 코드 복사
COPY toto-fe .  # 소스 코드 및 모든 파일 복사

# 2단계: 개발 환경 스테이지
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# 빌드된 소스 코드 복사
COPY --from=build /usr/src/app ./

# 포트 노출
EXPOSE 5173  # Vite의 기본 개발 서버 포트

# 개발 서버 실행 명령
CMD ["npm", "run", "dev", "--", "--host"]

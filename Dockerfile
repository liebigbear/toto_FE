# Node.js 기반 이미지 사용
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16

# 컨테이너 내 작업 디렉토리 설정
WORKDIR /usr/src/app

# 프로젝트의 package.json 및 package-lock.json 파일을 복사
COPY toto-fe/package*.json ./

# 필요한 패키지 설치
RUN npm install

# 빌드 디렉토리 생성 및 빌드된 파일 복사
RUN mkdir -p build
COPY toto-fe/dist/ ./build/

# 'serve' 패키지를 전역으로 설치하여 정적 파일을 서빙
RUN npm install -g serve

# 컨테이너에서 사용할 포트 지정
EXPOSE 3000

# 애플리케이션 실행 명령어
CMD ["serve", "build"]

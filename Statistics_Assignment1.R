
# 문제 6. 정규분포 확률밀도 그래프

# 평균과 표준편차 설정
mu <- 70
sigma <- 10

# 40점부터 100점까지 400개의 점 생성
x <- seq(40, 100, length.out=400)

# 각 점에서 정규분포의 확률밀도 계산
y <- dnorm(x, mean=mu, sd=sigma)

# 정규분포 그래프 그리기
plot(x, y,
     type='l',
     lwd=2,
     col='blue',
     main='Exam scores: Normal distribution',
     xlab='Score',
     ylab='Density',
     xlim=c(40, 100))

# 평균 70점을 점선으로 표시
abline(v=mu, lty=2, lwd=2, col='red')

# 범례 추가
legend('topright',
       legend=c('Normal density', 'Mean = 70'),
       col=c('blue', 'red'),
       lty=c(1, 2),
       lwd=2,
       bty='n')

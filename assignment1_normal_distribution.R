
# 통계학입문 과제 1 — 정규분포 (R 학생용)
# 이름: 조수아
# 학번: 2026182008
# 목표: 정규분포의 표준화, 확률, 분위수, 확률밀도 그래프를 계산함
# 별도의 패키지 설치 없이 base R만 사용함

# [상황] 시험 점수 X는 평균 70점, 표준편차 10점의 정규분포를 따름
# X ~ N(70, 10^2)

# 문제 1. 평균과 표준편차를 저장할 것
mu <- 70
sigma <- 10

# 문제 2. 85점의 Z-score를 계산할 것
score <- 85
z_score <- (score - mu) / sigma

# 문제 3. P(X >= 80)을 계산할 것
p_above_80 <- pnorm(80, mean=mu, sd=sigma, lower.tail=FALSE)

# 문제 4. P(60 <= X <= 80)을 계산할 것
p_60_to_80 <- pnorm(80, mean=mu, sd=sigma) -
  pnorm(60, mean=mu, sd=sigma)

# 문제 5. 상위 5% 경계 점수(95백분위수)를 구할 것
cutoff_top_5 <- qnorm(0.95, mean=mu, sd=sigma)

cat('2. Z-score:', z_score, '\n')
cat('3. P(X >= 80):', p_above_80, '\n')
cat('4. P(60 <= X <= 80):', p_60_to_80, '\n')
cat('5. 상위 5% 기준점:', cutoff_top_5, '\n')

# 문제 6. 정규분포 확률밀도 그래프를 작성할 것
if (!is.na(mu) && !is.na(sigma)) {
  x <- seq(40, 100, length.out=400)
  y <- dnorm(x, mean=mu, sd=sigma)
  
  if (!all(is.na(y))) {
    plot(x, y, type='l', lwd=2, main='Exam scores: Normal distribution',
         xlab='Score', ylab='Density')
    abline(v=mu, lty=2)
    legend('topright', legend=c('Normal density', 'Mean = 70'),
           lty=c(1, 2), bty='n')
  }
}

# [서술]
# 시험 점수는 평균 70점, 표준편차 10점인 정규분포를 따른다.
# 80점 이상을 받을 확률은 약 15.87%이며,
# 60점에서 80점 사이의 점수를 받을 확률은 약 68.27%이다.
# 상위 5%에 해당하는 점수는 약 86.45점이다.

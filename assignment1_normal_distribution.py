
# 통계학입문 과제 1 — 정규분포
# 이름: 조수아
# 학번: 2026182008
# 목표: 정규분포의 표준화, 확률, 분위수, 확률밀도 그래프를 계산함

import numpy as np
from scipy import stats
import matplotlib.pyplot as plt

# 시험 점수 X ~ N(70, 10^2)

# 문제 1. 평균과 표준편차
mu = 70
sigma = 10

# 문제 2. 85점의 Z-score
score = 85
z_score = (score - mu) / sigma

# 문제 3. 80점 이상 받을 확률
p_above_80 = stats.norm.sf(80, loc=mu, scale=sigma)

# 문제 4. 60~80점 사이 확률
p_60_to_80 = (
    stats.norm.cdf(80, loc=mu, scale=sigma)
    - stats.norm.cdf(60, loc=mu, scale=sigma)
)

# 문제 5. 상위 5%에 해당하는 점수
cutoff_top_5 = stats.norm.ppf(0.95, loc=mu, scale=sigma)

# 계산 결과 출력
print('2. Z-score:', z_score)
print('3. P(X >= 80):', p_above_80)
print('4. P(60 <= X <= 80):', p_60_to_80)
print('5. 상위 5% 기준점:', cutoff_top_5)

# 문제 6. 정규분포 확률밀도함수 그래프
if mu is not None and sigma is not None:
    x = np.linspace(40, 100, 400)
    y = stats.norm.pdf(x, loc=mu, scale=sigma)

    if y is not None:
        plt.plot(x, y, label='Normal density')
        plt.axvline(mu, linestyle='--', label='Mean = 70')
        plt.title('Exam scores: Normal distribution')
        plt.xlabel('Score')
        plt.ylabel('Density')
        plt.legend()
        plt.grid(alpha=0.3)
        plt.show()

# [서술]
# 시험 점수는 평균 70점, 표준편차 10점인 정규분포를 따른다.
# 80점 이상을 받을 확률은 약 15.87%이며,
# 60점에서 80점 사이의 점수를 받을 확률은 약 68.27%이다.
# 상위 5%에 해당하는 점수는 약 86.45점이다.

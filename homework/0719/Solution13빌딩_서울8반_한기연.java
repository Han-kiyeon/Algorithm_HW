package com.ssafy.algo;

import java.io.FileInputStream;
import java.util.Arrays;
import java.util.Scanner;

public class Solution13빌딩_서울8반_한기연 {
	static char[][] barr;
	static int N;
	static int max;

	public static boolean isPark(int i, int j) {
		// 8방향 탐색
		int[] di = { -1, -1, 0, 1, 1, 1, 0, -1 };// 시계방향 탐색
		int[] dj = { 0, 1, 1, 1, 0, -1, -1, -1 };

		for (int d = 0; d < di.length; d++) {
			int ni = i + di[d];
			int nj = j + dj[d];
			if (0 <= ni && ni < N && 0 <= nj && nj < N) { // ArrayIndexOutOfBoundsException
				if (barr[ni][nj] == 'G') { // 인접구획에 공원 조성단지G가 있다면 2층 높이로 세울 수 잇음
					return true; // 인접 구획에 공원 조성단지가 있다.
				}
			}
		}
		return false; // 인접 구획에 공원 조성 단지 없음.
	}

	public static int isBuilding(int i, int j) {
		int rlt = -1;

		for (int r = 0; r < N; r++)
			if (barr[r][j] == 'B')
				rlt++;

		for (int l = 0; l < N; l++)
			if (barr[i][l] == 'B')
				rlt++;

		return rlt; // 결과 리턴
	}

	public static void main(String[] args) throws Exception {
		System.setIn(new FileInputStream("res/Solution13빌딩.txt"));
		Scanner s = new Scanner(System.in);

		int T = s.nextInt();// 테스트 케이스 개수 입력
		for (int tc = 1; tc <= T; tc++) {
			N = s.nextInt();// 배열의 크기 N(3~20) 입력

			max = Integer.MIN_VALUE; // 결과값 초기화

			barr = new char[N][N]; // 배열 생성

			// 배열입력
			for (int i = 0; i < N; i++) {
				for (int j = 0; j < N; j++) {
					// 빌딩 구획이면 B, 공원조성단지이면 G
					barr[i][j] = s.next().charAt(0);
				}
			}
			// 공원 조성단지 탐색
			for (int i = 0; i < N; i++) {
				for (int j = 0; j < N; j++) {
					if (barr[i][j] == 'B' && isPark(i, j)) { // 공원 조성단지가 있다면
						max = (max > 2) ? max : 2;
					} else if (barr[i][j] == 'B' && !isPark(i, j)) { // 공원 조성 단지가 없다면
						max = (max > isBuilding(i, j)) ? max : isBuilding(i, j);
					}
				}
			}

			System.out.println("#" + tc + " " + max);
		}

		s.close();
	}

}

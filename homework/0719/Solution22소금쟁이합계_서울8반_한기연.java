package com.ssafy.algo;

import java.io.FileInputStream;
import java.util.Arrays;
import java.util.Scanner;

public class Solution22소금쟁이합계_서울8반_한기연 {

	public static void main(String[] args) throws Exception {
		System.setIn(new FileInputStream("res/Solution22소금쟁이합계.txt"));
		Scanner s = new Scanner(System.in);

		int T = s.nextInt(); // 테스트 캐이스 개수

		for (int tc = 1; tc <= T; tc++) {

			int N = s.nextInt(); // 배열의 크기 N (5~20)
			int[][] matrix = new int[N][N]; // 배열 생성

			int bugs = s.nextInt();// 소금쟁이의 수
			for (int bug = 0; bug < bugs; bug++) {
				int row = s.nextInt();
				int col = s.nextInt();

				if (matrix[row][col] == 1) {// 시작 위치에 소금쟁이가 있다면
					s.nextLine(); // dir
					continue;
				} else
					matrix[row][col] = 1;
				int jump;
				switch (s.nextInt()) {// 소금쟁이의 이동방향 (상1,하2,좌3,우4)
				case 1: // 상
					jump = -3;
					for (int i = 0; i < 3; i++) {
						if ((0 <= (row + jump)) && ((row + jump) < N)) { // 연못안에있다.
							if (matrix[row + jump][col] != 1) { // 이동 방향에 소금쟁이 없음
								matrix[row][col] = 0;
								matrix[row + jump][col] = 1;
								row += jump;
								jump++;
							} else {
								matrix[row][col] = 0; // 죽음
								break;
							}
						} else { // 연못 안에 없다
							matrix[row][col] = 0; // 죽음
							break;
						}
					}
					break;
				case 2: // 하
					jump = 3;
					for (int i = 0; i < 3; i++) {
						if ((0 <= (row + jump)) && ((row + jump) < N)) {// idx err
							if (matrix[row + jump][col] != 1) { // 이동 방향에 소금쟁이 없음
								matrix[row][col] = 0;
								matrix[row + jump][col] = 1;
								row += jump;
								jump--;
							} else {
								matrix[row][col] = 0; // 죽음
								break;
							}
						} else {
							matrix[row][col] = 0; // 죽음
							break;
						}
					}
					break;
				case 3: // 좌
					jump = -3;
					for (int i = 0; i < 3; i++) {
						if ((0 <= (col + jump)) && ((col + jump) < N)) {// idx err
							if (matrix[row][col + jump] != 1) { // 이동 방향에 소금쟁이 없음
								matrix[row][col] = 0;
								matrix[row][col + jump] = 1;
								col += jump;
								jump++;
							} else {
								matrix[row][col] = 0; // 죽음
								break;
							}
						} else {
							matrix[row][col] = 0; // 죽음
							break;
						}
					}
					break;
				case 4: // 우
					jump = 3;
					for (int i = 0; i < 3; i++) {
						if ((0 <= (col + jump)) && ((col + jump) < N)) {// idx err
							if (matrix[row][col + jump] != 1) { // 이동 방향에 소금쟁이 없음
								matrix[row][col] = 0;
								matrix[row][col + jump] = 1;
								col += jump;
								jump--;
							} else {
								matrix[row][col] = 0; // 죽음
								break;
							}
						} else {
							matrix[row][col] = 0; // 죽음
							break;
						}
					}
					break;

				default:
					break;
				}
			}

			int ans = 0;
			for (int i = 0; i < N; i++)
				for (int j = 0; j < N; j++)
					if (matrix[i][j] == 1)
						ans++;



			System.out.println("#" + tc + " " + ans);

		}

		s.close();
	}

}

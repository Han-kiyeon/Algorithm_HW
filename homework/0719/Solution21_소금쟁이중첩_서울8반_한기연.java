package com.ssafy.algo;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Solution21_소금쟁이중첩_서울8반_한기연 {

	static int N;
	static int[][] pool;
	////////////////////// 하1 우2
	static int[] dx = { 0, 1, 0 };
	static int[] dy = { 0, 0, 1 };

	static public boolean move(int x, int y, int dir) {
		boolean ans = false;
		for (int k = 3; k > 0; k--) {
			int nx = x + dx[dir] * k;
			int ny = y + dy[dir] * k;
			if (nx < 0 || nx >= N || ny < 0 || ny >= N) { // 밖에 있을때
				break;
			} else if (pool[nx][ny] == 1) {
				ans =  true;
			} else {
				pool[nx][ny] = 1;
				x = nx;
				y = ny;
			}
		}
		return ans;
	}

	public static void main(String[] args) throws Exception {

		System.setIn(new FileInputStream("res/Solution21소금쟁이중첩.txt"));
		Scanner s = new Scanner(System.in);

		int T = s.nextInt();
		for (int tc = 1; tc <= T; tc++) {
			System.out.print("#" + tc + " ");
			N = s.nextInt();
			pool = new int[N][N];
			int ws = s.nextInt();
			boolean flag = true;

			for (int i = 1; i <= ws; i++) {
				int x = s.nextInt();
				int y = s.nextInt();
				if (pool[x][y] == 1) {
					System.out.println(i + " ");
					continue;
				} else
					pool[x][y] = 1;
				int dir = s.nextInt();
				if (move(x, y, dir)) {
					System.out.println(i + " ");
					flag = false;
				}
			}
			if (flag)
				System.out.println(0);

		}
	}
}
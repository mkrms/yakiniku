/*
 * C言語のサンプルプログラム - Webkaru
 * - テキストファイルに追記 -
 */
#include <stdio.h>

int main(void){

  /* 追記する文字列を格納 */
  char ch[100];

  /* ファイルポインタ */
  FILE *fp;

  /* ファイルを追記モードでオープン */
  fp = fopen("../sampleapp/app/views/items/result.txt", "a");

  /* ファイルが適切に読み込まれているかを確認 */
  if( fp == NULL ) {
    perror("ファイルの読み込みに失敗！\n");
    return 1;
  }

  /* 追記する文字列の入力 */
  printf("追記する文字列 = ");
  fgets(ch, sizeof(ch), stdin);

  /* 入力した文字列をファイルに書き込む */
  fprintf(fp, "%s", ch);
  fclose(fp);

  return 0;
}

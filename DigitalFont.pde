//font
//----------
public char[] a0z25 = {' ', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};
public int[] digiFont = {0, 14240, 14256, 12432, 11376, 12944, 12928, 12720, 6048, 2112, 1072, 4741, 4240, 15520, 5289, 13488, 14208, 13489, 14209, 13104, 10304, 5296, 4230, 5360, 15, 14, 8214, 1060, 10128, 9520, 5920, 13104, 13232, 8198, 14256, 14128, 13494};
public int nthFromTheEndNum(int n, int num) {
  return (int)(num/Math.pow(10, n-1))%10;
}
public int[] nToBinary(int num) {
  int[] ans;
  int tempI = 0;
  int tempNum = num;
  while (Math.pow(2, tempI) <= num) {
    tempI++;
  }
  ans = new int[tempI];
  for (int i = 0; i < ans.length; i++) {
    if (tempNum >= Math.pow(2, ans.length-1-i)) {
      ans[i] = 1;
      tempNum -= Math.pow(2, ans.length-1-i);
    } else {
      ans[i] = 0;
    }
  }
  return ans;
}

public void fontText(String fs, float fx, float fy, float fw, float fh, int fc, String fa, String ff) {
  float tempX = fx;
  if (fa == "LEFT") {
    tempX = fx+fw/2;
  } else if (fa == "CENTER") {
    tempX = fx - ((fs.length()-1)*fw*1.5)/2;
  } else if (fa == "RIGHT") {
    tempX = fx - ((fs.length())*fw*1.5-fw);
  }
  stroke(fc);
  if (fw > fh) {
    strokeWeight(fh/5);
  } else {
    strokeWeight(fw/5);
  }
  for (int i = 0; i < fs.length(); i++) {
    letter(fs.charAt(i), tempX, fy, fw, fh, ff);
    tempX += fw*1.5;
  }
}
public void letter(char lc, float lx, float  ly, float lw, float lh, String lf) {
  int tempN = 0;
  for (int k = 0; k < a0z25.length; k++) {
    if (lc == a0z25[k]) {
      tempN = k;
    }
  }
  if (lf == "digital") {
    for (int j = 0; j < nToBinary(digiFont[tempN]).length; j++) {
      if (nToBinary(digiFont[tempN])[nToBinary(digiFont[tempN]).length-1-j] == 1) {
        if (j == 0) {
          line(lx+lw/2, ly+lh/2, lx, ly);
        }
        if (j == 1) {
          line(lx-lw/2, ly+lh/2, lx, ly);
        }
        if (j == 2) {
          line(lx+lw/2, ly-lh/2, lx, ly);
        }
        if (j == 3) {
          line(lx-lw/2, ly-lh/2, lx, ly);
        }
        if (j == 4) {
          line(lx-lw/2, ly+lh/2, lx+lw/2, ly+lh/2);
        }
        if (j == 5) {
          line(lx+lw/2, ly, lx+lw/2, ly+lh/2);
        }
        if (j == 6) {
          line(lx, ly, lx, ly+lh/2);
        }
        if (j == 7) {
          line(lx-lw/2, ly, lx-lw/2, ly+lh/2);
        }
        if (j == 8) {
          line(lx, ly, lx+lw/2, ly);
        }
        if (j == 9) {
          line(lx-lw/2, ly, lx, ly);
        }
        if (j == 10) {
          line(lx+lw/2, ly-lh/2, lx+lw/2, ly);
        }
        if (j == 11) {
          line(lx, ly-lh/2, lx, ly);
        }
        if (j == 12) {
          line(lx-lw/2, ly-lh/2, lx-lw/2, ly);
        }
        if (j == 13) {
          line(lx-lw/2, ly-lh/2, lx+lw/2, ly-lh/2);
        }
      }
    }
  }
}


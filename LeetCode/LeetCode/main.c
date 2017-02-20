//
//  main.c
//  LeetCode
//
//  Created by zyfoolboy on 2017/2/18.
//  Copyright © 2017年 zyfoolboy. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    int a[] = {1,1,1,2,2,2,3,3,3,5,5,5,8,8,8,10,9,9,9};
    int n = sizeof(a) / sizeof(a[0]);
    int result = findThree(a,n);
    
    return 0;
}



/**
 数组A中，除了某一个数字x之外，其他数字都出现了三次，而x出现了一次。请给出最快的方法，找到x。
 @param nums 数组
 @param numsSize 数组大小
 @return x
 */
int findThree(int nums[], int numsSize) {
    int m[32];
    int result = 0;
    for (int i = 0; i < 32; i++) {
        m[i] = 0;
    }
    
    for (int i = 0; i < 32; i++) {
        //统计 nums 数组中所有元素的二进制值的第 i 位，相加后存入 m[i] 中
        for (int j = 0; j < numsSize; j++) {
            int bit = nums[j] & 1; //获得数组中第 j 个元素的二进制值的第 i 位的值
            m[i] += bit;
            nums[j] >>= 1; //第 i 位取到之后砍掉，下一次用 nums[j] & 1 取到的就是 i + 1 位
        }
    }
    
    for (int i = 0; i < 32; i++) {
        if (m[i] % 3 != 0) {
            result |= (1 << i); 
        }
    }
    
    return result;
}


/**
 Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times. The algorithm should run in linear time and in O(1) space.
 @param nums array
 @param numsSize array size
 @param returnSize Return an array of size *returnSize.
 @return Return an array of size *returnSize.
 Note: The returned array must be malloced, assume caller calls free().
 */
int* majorityElementII(int* nums, int numsSize, int* returnSize) {
    
    
    
    return returnSize;
}


/**
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 
 You may assume that the array is non-empty and the majority element always exist in the array.
 
 @param nums array
 @param numsSize array size
 @return majority element
 */
int majorityElement(int* nums, int numsSize) {
    int majority = nums[0];
    int count = 0;
    for (int i = 1; i < numsSize; i ++) {
        if (majority == nums[i]) {
            count++;
        } else if (count == 0) {
            majority = nums[i];
        } else {
            count --;
        }
    }
    return majority;
}



/**
 Given an unsorted integer array, find the first missing positive integer.
 
 For example,
 Given [1,2,0] return 3,
 and [3,4,-1,1] return 2.
 
 Your algorithm should run in O(n) time and uses constant space.

 @param nums array
 @param numsSize array size
 @return the missing positive
 */
int firstMissingPositive(int *nums, int numsSize) {
    
    for (int i = 0; i < numsSize; i ++ ) {
        while (nums[i] != i + 1) {
            if (nums[i] <= 0 || nums[i] > numsSize || nums[i] == nums[nums[i] - 1]) {
                break;
            }
            
            int temp = nums[i];
            nums[i] = nums[temp - 1];
            nums[temp - 1] = temp;
        }
    }
    
    for (int i = 0; i < numsSize; i ++) {
        if (nums[i] != i + 1) {
            return  i + 1;
        }
    }
    
    
    return numsSize + 1;
}

//
//  main.c
//  LeetCode
//
//  Created by 林盼盼 on 2017/2/18.
//  Copyright © 2017年 林盼盼. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    
    
    return 0;
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

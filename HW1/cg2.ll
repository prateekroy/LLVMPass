; ModuleID = 'cg.c'
source_filename = "cg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@firstrow = internal unnamed_addr global i1 false, align 4
@lastrow = internal unnamed_addr global i1 false, align 4
@firstcol = internal unnamed_addr global i1 false, align 4
@lastcol = internal unnamed_addr global i1 false, align 4
@.str.1 = private unnamed_addr constant [13 x i8] c" Size: %10d\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c" Iterations: %5d\0A\00", align 1
@naa = internal unnamed_addr global i1 false, align 4
@nzz = internal unnamed_addr global i1 false, align 4
@tran = internal global double 0.000000e+00, align 8
@amult = internal unnamed_addr global double 0.000000e+00, align 8
@a = internal unnamed_addr global [2198001 x double] zeroinitializer, align 16
@colidx = internal unnamed_addr global [2198001 x i32] zeroinitializer, align 16
@rowstr = internal unnamed_addr global [14002 x i32] zeroinitializer, align 16
@arow = internal unnamed_addr global [2198001 x i32] zeroinitializer, align 16
@acol = internal unnamed_addr global [2198001 x i32] zeroinitializer, align 16
@aelt = internal unnamed_addr global [2198001 x double] zeroinitializer, align 16
@v = internal unnamed_addr global [14002 x double] zeroinitializer, align 16
@iv = internal unnamed_addr global [28002 x i32] zeroinitializer, align 16
@x = internal unnamed_addr global [14003 x double] zeroinitializer, align 16
@q = internal unnamed_addr global [14003 x double] zeroinitializer, align 16
@z = internal unnamed_addr global [14003 x double] zeroinitializer, align 16
@r = internal unnamed_addr global [14003 x double] zeroinitializer, align 16
@p = internal unnamed_addr global [14003 x double] zeroinitializer, align 16
@.str.4 = private unnamed_addr constant [30 x i8] c"    %5d       %20.14e%20.13e\0A\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c" Zeta is    %20.12e\0A\00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c" Error is   %20.12e\0A\00", align 1
@.str.10 = private unnamed_addr constant [30 x i8] c" Zeta                %20.12e\0A\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c" The correct zeta is %20.12e\0A\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"CG\00", align 1
@.str.15 = private unnamed_addr constant [25 x i8] c"          floating point\00", align 1
@.str.16 = private unnamed_addr constant [15 x i8] c"3.0 structured\00", align 1
@.str.17 = private unnamed_addr constant [12 x i8] c"27 Sep 2018\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"clang\00", align 1
@.str.19 = private unnamed_addr constant [4 x i8] c"-lm\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c"-I../common\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"-O2 \00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c"(none)\00", align 1
@.str.23 = private unnamed_addr constant [7 x i8] c"randdp\00", align 1
@conj_grad.callcount = internal unnamed_addr global i32 0, align 4
@.str.25 = private unnamed_addr constant [22 x i8] c"nnza, nzmax = %d, %d\0A\00", align 1
@.str.26 = private unnamed_addr constant [13 x i8] c"iouter = %d\0A\00", align 1
@str = private unnamed_addr constant [74 x i8] c"\0A\0A NAS Parallel Benchmarks 3.0 structured OpenMP C version - CG Benchmark\00"
@str.27 = private unnamed_addr constant [21 x i8] c" Benchmark completed\00"
@str.28 = private unnamed_addr constant [21 x i8] c" VERIFICATION FAILED\00"
@str.29 = private unnamed_addr constant [25 x i8] c" VERIFICATION SUCCESSFUL\00"
@str.30 = private unnamed_addr constant [50 x i8] c"   iteration           ||r||                 zeta\00"
@str.32 = private unnamed_addr constant [44 x i8] c"Space for matrix elements exceeded in makea\00"

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readnone) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = bitcast double* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #6
  store i1 true, i1* @firstrow, align 4
  store i1 true, i1* @lastrow, align 4
  store i1 true, i1* @firstcol, align 4
  store i1 true, i1* @lastcol, align 4
  %5 = tail call i32 @puts(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @str, i64 0, i64 0))
  %6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 14000)
  %7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i32 15)
  store i1 true, i1* @naa, align 4
  store i1 true, i1* @nzz, align 4
  store double 0x41B2B9B0A1000000, double* @tran, align 8, !tbaa !2
  store double 0x41D2309CE5400000, double* @amult, align 8, !tbaa !2
  %8 = tail call double @randlc(double* nonnull @tran, double 0x41D2309CE5400000) #6
  %9 = load i1, i1* @naa, align 4
  %10 = select i1 %9, i32 14000, i32 0
  %11 = load i1, i1* @nzz, align 4
  %12 = select i1 %11, i32 2198000, i32 0
  %13 = load i1, i1* @firstrow, align 4
  %14 = zext i1 %13 to i32
  %15 = load i1, i1* @lastrow, align 4
  %16 = select i1 %15, i32 14000, i32 0
  %17 = load i1, i1* @firstcol, align 4
  %18 = zext i1 %17 to i32
  %19 = load i1, i1* @lastcol, align 4
  %20 = select i1 %19, i32 14000, i32 0
  %21 = sitofp i32 %10 to double
  %22 = fdiv double 1.000000e+00, %21
  %23 = tail call double @pow(double 1.000000e-01, double %22) #6
  br i1 %9, label %24, label %182

; <label>:24:                                     ; preds = %2
  %25 = zext i32 %10 to i64
  %26 = or i64 %25, 1
  %27 = getelementptr [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %26
  %28 = bitcast i32* %27 to i8*
  %29 = shl nuw nsw i32 %10, 2
  %30 = zext i32 %29 to i64
  tail call void @llvm.memset.p0i8.i64(i8* %28, i8 0, i64 %30, i32 4, i1 false) #6
  %31 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %25
  br label %32

; <label>:32:                                     ; preds = %178, %24
  %33 = phi i32 [ 0, %24 ], [ %172, %178 ]
  %34 = phi i32 [ 1, %24 ], [ %180, %178 ]
  %35 = phi double [ 1.000000e+00, %24 ], [ %179, %178 ]
  br label %36

; <label>:36:                                     ; preds = %36, %32
  %37 = phi i32 [ 1, %32 ], [ %38, %36 ]
  %38 = shl nsw i32 %37, 1
  %39 = icmp slt i32 %38, %10
  br i1 %39, label %36, label %40

; <label>:40:                                     ; preds = %36
  %41 = sitofp i32 %38 to double
  br label %42

; <label>:42:                                     ; preds = %67, %40
  %43 = phi i32 [ 0, %40 ], [ %69, %67 ]
  %44 = phi i32 [ 0, %40 ], [ %68, %67 ]
  br label %45

; <label>:45:                                     ; preds = %45, %42
  %46 = load double, double* @amult, align 8, !tbaa !2
  %47 = tail call double @randlc(double* nonnull @tran, double %46) #6
  %48 = load double, double* @amult, align 8, !tbaa !2
  %49 = tail call double @randlc(double* nonnull @tran, double %48) #6
  %50 = fmul double %49, %41
  %51 = fptosi double %50 to i32
  %52 = icmp sgt i32 %10, %51
  br i1 %52, label %53, label %45

; <label>:53:                                     ; preds = %45
  %54 = add nsw i32 %51, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32* %31, i64 %55
  %57 = load i32, i32* %56, align 4, !tbaa !6
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %67

; <label>:59:                                     ; preds = %53
  store i32 1, i32* %56, align 4, !tbaa !6
  %60 = add nsw i32 %43, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %61
  store i32 %54, i32* %62, align 4, !tbaa !6
  %63 = add nsw i32 %44, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %64
  store double %47, double* %65, align 8, !tbaa !2
  %66 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %64
  store i32 %54, i32* %66, align 4, !tbaa !6
  br label %67

; <label>:67:                                     ; preds = %59, %53
  %68 = phi i32 [ %63, %59 ], [ %44, %53 ]
  %69 = phi i32 [ %60, %59 ], [ %43, %53 ]
  %70 = icmp slt i32 %68, 11
  br i1 %70, label %42, label %71

; <label>:71:                                     ; preds = %67
  %72 = icmp slt i32 %69, 1
  br i1 %72, label %122, label %73

; <label>:73:                                     ; preds = %71
  %74 = add i32 %69, 1
  %75 = zext i32 %74 to i64
  %76 = add nsw i64 %75, -2
  %77 = and i32 %69, 3
  %78 = zext i32 %77 to i64
  %79 = icmp ult i64 %76, 3
  br i1 %79, label %108, label %80

; <label>:80:                                     ; preds = %73
  %81 = add nsw i64 %75, -1
  %82 = sub nsw i64 %81, %78
  br label %83

; <label>:83:                                     ; preds = %83, %80
  %84 = phi i64 [ 1, %80 ], [ %105, %83 ]
  %85 = phi i64 [ %82, %80 ], [ %106, %83 ]
  %86 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %84
  %87 = load i32, i32* %86, align 4, !tbaa !6
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32* %31, i64 %88
  store i32 0, i32* %89, align 4, !tbaa !6
  %90 = add nuw nsw i64 %84, 1
  %91 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %90
  %92 = load i32, i32* %91, align 4, !tbaa !6
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32* %31, i64 %93
  store i32 0, i32* %94, align 4, !tbaa !6
  %95 = add nuw nsw i64 %84, 2
  %96 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %95
  %97 = load i32, i32* %96, align 4, !tbaa !6
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32* %31, i64 %98
  store i32 0, i32* %99, align 4, !tbaa !6
  %100 = add nuw nsw i64 %84, 3
  %101 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %100
  %102 = load i32, i32* %101, align 4, !tbaa !6
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32* %31, i64 %103
  store i32 0, i32* %104, align 4, !tbaa !6
  %105 = add nuw nsw i64 %84, 4
  %106 = add i64 %85, -4
  %107 = icmp eq i64 %106, 0
  br i1 %107, label %108, label %83

; <label>:108:                                    ; preds = %83, %73
  %109 = phi i64 [ 1, %73 ], [ %105, %83 ]
  %110 = icmp eq i32 %77, 0
  br i1 %110, label %122, label %111

; <label>:111:                                    ; preds = %108
  br label %112

; <label>:112:                                    ; preds = %112, %111
  %113 = phi i64 [ %119, %112 ], [ %109, %111 ]
  %114 = phi i64 [ %120, %112 ], [ %78, %111 ]
  %115 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %113
  %116 = load i32, i32* %115, align 4, !tbaa !6
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32* %31, i64 %117
  store i32 0, i32* %118, align 4, !tbaa !6
  %119 = add nuw nsw i64 %113, 1
  %120 = add i64 %114, -1
  %121 = icmp eq i64 %120, 0
  br i1 %121, label %122, label %112, !llvm.loop !8

; <label>:122:                                    ; preds = %108, %112, %71
  %123 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 1), align 4, !tbaa !6
  %124 = icmp eq i32 %123, %34
  br i1 %124, label %125, label %126

; <label>:125:                                    ; preds = %122
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 1), align 8, !tbaa !2
  br label %126

; <label>:126:                                    ; preds = %125, %122
  %127 = phi i32 [ 1, %125 ], [ 0, %122 ]
  %128 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 2), align 8, !tbaa !6
  %129 = icmp eq i32 %128, %34
  br i1 %129, label %461, label %462

; <label>:130:                                    ; preds = %507
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 12), align 16, !tbaa !2
  store i32 %34, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 12), align 16, !tbaa !6
  br label %131

; <label>:131:                                    ; preds = %507, %506, %130
  %132 = phi i64 [ 12, %130 ], [ 11, %507 ], [ 11, %506 ]
  br label %133

; <label>:133:                                    ; preds = %175, %131
  %134 = phi i32 [ %177, %175 ], [ %123, %131 ]
  %135 = phi i64 [ %173, %175 ], [ 1, %131 ]
  %136 = phi i32 [ %172, %175 ], [ %33, %131 ]
  %137 = icmp slt i32 %134, %18
  %138 = icmp sgt i32 %134, %20
  %139 = or i1 %137, %138
  br i1 %139, label %171, label %140

; <label>:140:                                    ; preds = %133
  %141 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %135
  %142 = load double, double* %141, align 8, !tbaa !2
  %143 = fmul double %35, %142
  br label %144

; <label>:144:                                    ; preds = %167, %140
  %145 = phi i64 [ %169, %167 ], [ 1, %140 ]
  %146 = phi i32 [ %168, %167 ], [ %136, %140 ]
  %147 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %145
  %148 = load i32, i32* %147, align 4, !tbaa !6
  %149 = icmp slt i32 %148, %14
  %150 = icmp sgt i32 %148, %16
  %151 = or i1 %149, %150
  br i1 %151, label %167, label %152

; <label>:152:                                    ; preds = %144
  %153 = add nsw i32 %146, 1
  %154 = icmp slt i32 %146, %12
  br i1 %154, label %159, label %155

; <label>:155:                                    ; preds = %152
  %156 = tail call i32 @puts(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @str.32, i64 0, i64 0)) #6
  %157 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i64 0, i64 0), i32 %153, i32 %12) #6
  %158 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i64 0, i64 0), i32 %34) #6
  tail call void @exit(i32 1) #7
  unreachable

; <label>:159:                                    ; preds = %152
  %160 = sext i32 %153 to i64
  %161 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %160
  store i32 %134, i32* %161, align 4, !tbaa !6
  %162 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %160
  store i32 %148, i32* %162, align 4, !tbaa !6
  %163 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %145
  %164 = load double, double* %163, align 8, !tbaa !2
  %165 = fmul double %143, %164
  %166 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %160
  store double %165, double* %166, align 8, !tbaa !2
  br label %167

; <label>:167:                                    ; preds = %159, %144
  %168 = phi i32 [ %153, %159 ], [ %146, %144 ]
  %169 = add nuw nsw i64 %145, 1
  %170 = icmp ult i64 %145, %132
  br i1 %170, label %144, label %171

; <label>:171:                                    ; preds = %167, %133
  %172 = phi i32 [ %136, %133 ], [ %168, %167 ]
  %173 = add nuw nsw i64 %135, 1
  %174 = icmp ult i64 %135, %132
  br i1 %174, label %175, label %178

; <label>:175:                                    ; preds = %171
  %176 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %173
  %177 = load i32, i32* %176, align 4, !tbaa !6
  br label %133

; <label>:178:                                    ; preds = %171
  %179 = fmul double %23, %35
  %180 = add nuw nsw i32 %34, 1
  %181 = icmp ult i32 %34, %10
  br i1 %181, label %32, label %182

; <label>:182:                                    ; preds = %178, %2
  %183 = phi i32 [ 0, %2 ], [ %172, %178 ]
  %184 = icmp ult i32 %16, %14
  br i1 %184, label %209, label %185

; <label>:185:                                    ; preds = %182
  br label %186

; <label>:186:                                    ; preds = %185, %205
  %187 = phi i32 [ %207, %205 ], [ %14, %185 ]
  %188 = phi i32 [ %206, %205 ], [ %183, %185 ]
  %189 = icmp ult i32 %187, %18
  %190 = icmp ugt i32 %187, %20
  %191 = or i1 %189, %190
  br i1 %191, label %205, label %192

; <label>:192:                                    ; preds = %186
  %193 = add nsw i32 %188, 1
  %194 = icmp slt i32 %188, %12
  br i1 %194, label %200, label %195

; <label>:195:                                    ; preds = %192
  %196 = add nuw nsw i32 %187, %10
  %197 = tail call i32 @puts(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @str.32, i64 0, i64 0)) #6
  %198 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i64 0, i64 0), i32 %193, i32 %12) #6
  %199 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i64 0, i64 0), i32 %196) #6
  tail call void @exit(i32 1) #7
  unreachable

; <label>:200:                                    ; preds = %192
  %201 = sext i32 %193 to i64
  %202 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %201
  store i32 %187, i32* %202, align 4, !tbaa !6
  %203 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %201
  store i32 %187, i32* %203, align 4, !tbaa !6
  %204 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %201
  store double -1.990000e+01, double* %204, align 8, !tbaa !2
  br label %205

; <label>:205:                                    ; preds = %200, %186
  %206 = phi i32 [ %193, %200 ], [ %188, %186 ]
  %207 = add nuw nsw i32 %187, 1
  %208 = icmp ult i32 %187, %16
  br i1 %208, label %186, label %209

; <label>:209:                                    ; preds = %205, %182
  %210 = phi i32 [ %183, %182 ], [ %206, %205 ]
  %211 = zext i32 %10 to i64
  %212 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %211
  %213 = sub nsw i32 %16, %14
  %214 = add nsw i32 %213, 1
  br i1 %9, label %215, label %218

; <label>:215:                                    ; preds = %209
  %216 = shl nuw nsw i32 %10, 2
  %217 = zext i32 %216 to i64
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1) to i8*), i8 0, i64 %217, i32 4, i1 false) #6
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 1) to i8*), i8 0, i64 %217, i32 4, i1 false) #6
  br label %218

; <label>:218:                                    ; preds = %209, %215
  %219 = or i32 %10, 1
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %220
  store i32 0, i32* %221, align 4, !tbaa !6
  %222 = icmp slt i32 %210, 1
  br i1 %222, label %266, label %223

; <label>:223:                                    ; preds = %218
  %224 = select i1 %13, i32 1, i32 2
  %225 = add i32 %210, 1
  %226 = and i32 %225, 1
  %227 = xor i32 %226, 1
  %228 = icmp eq i32 %225, 2
  br i1 %228, label %255, label %229

; <label>:229:                                    ; preds = %223
  %230 = zext i32 %227 to i64
  %231 = zext i32 %225 to i64
  %232 = add nsw i64 %231, -1
  %233 = sub nsw i64 %232, %230
  br label %234

; <label>:234:                                    ; preds = %234, %229
  %235 = phi i64 [ 1, %229 ], [ %252, %234 ]
  %236 = phi i64 [ %233, %229 ], [ %253, %234 ]
  %237 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %235
  %238 = load i32, i32* %237, align 4, !tbaa !6
  %239 = add i32 %238, %224
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %240
  %242 = load i32, i32* %241, align 4, !tbaa !6
  %243 = add nsw i32 %242, 1
  store i32 %243, i32* %241, align 4, !tbaa !6
  %244 = add nuw nsw i64 %235, 1
  %245 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %244
  %246 = load i32, i32* %245, align 4, !tbaa !6
  %247 = add i32 %246, %224
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %248
  %250 = load i32, i32* %249, align 4, !tbaa !6
  %251 = add nsw i32 %250, 1
  store i32 %251, i32* %249, align 4, !tbaa !6
  %252 = add nuw nsw i64 %235, 2
  %253 = add i64 %236, -2
  %254 = icmp eq i64 %253, 0
  br i1 %254, label %255, label %234

; <label>:255:                                    ; preds = %234, %223
  %256 = phi i64 [ 1, %223 ], [ %252, %234 ]
  %257 = icmp eq i32 %227, 0
  br i1 %257, label %266, label %258

; <label>:258:                                    ; preds = %255
  %259 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %256
  %260 = load i32, i32* %259, align 4, !tbaa !6
  %261 = add i32 %260, %224
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %262
  %264 = load i32, i32* %263, align 4, !tbaa !6
  %265 = add nsw i32 %264, 1
  store i32 %265, i32* %263, align 4, !tbaa !6
  br label %266

; <label>:266:                                    ; preds = %258, %255, %218
  store i32 1, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4, !tbaa !6
  %267 = icmp slt i32 %213, 0
  br i1 %267, label %303, label %268

; <label>:268:                                    ; preds = %266
  %269 = add nsw i32 %213, 2
  %270 = sext i32 %269 to i64
  br label %271

; <label>:271:                                    ; preds = %271, %268
  %272 = phi i32 [ %276, %271 ], [ 1, %268 ]
  %273 = phi i64 [ %277, %271 ], [ 2, %268 ]
  %274 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %273
  %275 = load i32, i32* %274, align 4, !tbaa !6
  %276 = add nsw i32 %275, %272
  store i32 %276, i32* %274, align 4, !tbaa !6
  %277 = add nuw nsw i64 %273, 1
  %278 = icmp slt i64 %273, %270
  br i1 %278, label %271, label %279

; <label>:279:                                    ; preds = %271
  %280 = load i32, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 0), align 16, !tbaa !6
  %281 = zext i32 %214 to i64
  br label %282

; <label>:282:                                    ; preds = %301, %279
  %283 = phi i32 [ %287, %301 ], [ %280, %279 ]
  %284 = phi i64 [ %285, %301 ], [ 0, %279 ]
  %285 = add nuw nsw i64 %284, 1
  %286 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %285
  %287 = load i32, i32* %286, align 4, !tbaa !6
  %288 = icmp slt i32 %283, %287
  br i1 %288, label %289, label %301

; <label>:289:                                    ; preds = %282
  %290 = sext i32 %283 to i64
  %291 = getelementptr [2198001 x double], [2198001 x double]* @a, i64 0, i64 %290
  %292 = bitcast double* %291 to i8*
  %293 = add i32 %283, 1
  %294 = icmp sgt i32 %287, %293
  %295 = select i1 %294, i32 %287, i32 %293
  %296 = xor i32 %283, -1
  %297 = add i32 %295, %296
  %298 = zext i32 %297 to i64
  %299 = shl nuw nsw i64 %298, 3
  %300 = add nuw nsw i64 %299, 8
  tail call void @llvm.memset.p0i8.i64(i8* %292, i8 0, i64 %300, i32 8, i1 false) #6
  br label %301

; <label>:301:                                    ; preds = %289, %282
  %302 = icmp eq i64 %285, %281
  br i1 %302, label %303, label %282

; <label>:303:                                    ; preds = %301, %266
  br i1 %222, label %375, label %304

; <label>:304:                                    ; preds = %303
  %305 = xor i1 %13, true
  %306 = zext i1 %305 to i32
  %307 = add i32 %210, 1
  %308 = and i32 %307, 1
  %309 = xor i32 %308, 1
  %310 = icmp eq i32 %307, 2
  br i1 %310, label %355, label %311

; <label>:311:                                    ; preds = %304
  %312 = zext i32 %309 to i64
  %313 = zext i32 %307 to i64
  %314 = add nsw i64 %313, -1
  %315 = sub nsw i64 %314, %312
  br label %316

; <label>:316:                                    ; preds = %316, %311
  %317 = phi i64 [ 1, %311 ], [ %352, %316 ]
  %318 = phi i64 [ %315, %311 ], [ %353, %316 ]
  %319 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %317
  %320 = load i32, i32* %319, align 4, !tbaa !6
  %321 = add i32 %320, %306
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %322
  %324 = load i32, i32* %323, align 4, !tbaa !6
  %325 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %317
  %326 = bitcast double* %325 to i64*
  %327 = load i64, i64* %326, align 8, !tbaa !2
  %328 = sext i32 %324 to i64
  %329 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %328
  %330 = bitcast double* %329 to i64*
  store i64 %327, i64* %330, align 8, !tbaa !2
  %331 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %317
  %332 = load i32, i32* %331, align 4, !tbaa !6
  %333 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %328
  store i32 %332, i32* %333, align 4, !tbaa !6
  %334 = add nsw i32 %324, 1
  store i32 %334, i32* %323, align 4, !tbaa !6
  %335 = add nuw nsw i64 %317, 1
  %336 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %335
  %337 = load i32, i32* %336, align 4, !tbaa !6
  %338 = add i32 %337, %306
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %339
  %341 = load i32, i32* %340, align 4, !tbaa !6
  %342 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %335
  %343 = bitcast double* %342 to i64*
  %344 = load i64, i64* %343, align 8, !tbaa !2
  %345 = sext i32 %341 to i64
  %346 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %345
  %347 = bitcast double* %346 to i64*
  store i64 %344, i64* %347, align 8, !tbaa !2
  %348 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %335
  %349 = load i32, i32* %348, align 4, !tbaa !6
  %350 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %345
  store i32 %349, i32* %350, align 4, !tbaa !6
  %351 = add nsw i32 %341, 1
  store i32 %351, i32* %340, align 4, !tbaa !6
  %352 = add nuw nsw i64 %317, 2
  %353 = add i64 %318, -2
  %354 = icmp eq i64 %353, 0
  br i1 %354, label %355, label %316

; <label>:355:                                    ; preds = %316, %304
  %356 = phi i64 [ 1, %304 ], [ %352, %316 ]
  %357 = icmp eq i32 %309, 0
  br i1 %357, label %375, label %358

; <label>:358:                                    ; preds = %355
  %359 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @arow, i64 0, i64 %356
  %360 = load i32, i32* %359, align 4, !tbaa !6
  %361 = add i32 %360, %306
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %362
  %364 = load i32, i32* %363, align 4, !tbaa !6
  %365 = getelementptr inbounds [2198001 x double], [2198001 x double]* @aelt, i64 0, i64 %356
  %366 = bitcast double* %365 to i64*
  %367 = load i64, i64* %366, align 8, !tbaa !2
  %368 = sext i32 %364 to i64
  %369 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %368
  %370 = bitcast double* %369 to i64*
  store i64 %367, i64* %370, align 8, !tbaa !2
  %371 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @acol, i64 0, i64 %356
  %372 = load i32, i32* %371, align 4, !tbaa !6
  %373 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %368
  store i32 %372, i32* %373, align 4, !tbaa !6
  %374 = add nsw i32 %364, 1
  store i32 %374, i32* %363, align 4, !tbaa !6
  br label %375

; <label>:375:                                    ; preds = %358, %355, %303
  %376 = icmp sgt i32 %213, -1
  br i1 %376, label %377, label %387

; <label>:377:                                    ; preds = %375
  %378 = sext i32 %214 to i64
  br label %379

; <label>:379:                                    ; preds = %379, %377
  %380 = phi i64 [ %378, %377 ], [ %385, %379 ]
  %381 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %380
  %382 = load i32, i32* %381, align 4, !tbaa !6
  %383 = add nuw nsw i64 %380, 1
  %384 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %383
  store i32 %382, i32* %384, align 4, !tbaa !6
  %385 = add nsw i64 %380, -1
  %386 = icmp sgt i64 %380, 1
  br i1 %386, label %379, label %387

; <label>:387:                                    ; preds = %379, %375
  store i32 1, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4, !tbaa !6
  br i1 %9, label %388, label %393

; <label>:388:                                    ; preds = %387
  %389 = shl nuw nsw i32 %10, 3
  %390 = zext i32 %389 to i64
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 1) to i8*), i8 0, i64 %390, i32 8, i1 false) #6
  %391 = shl nuw nsw i32 %10, 2
  %392 = zext i32 %391 to i64
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 1) to i8*), i8 0, i64 %392, i32 4, i1 false) #6
  br label %393

; <label>:393:                                    ; preds = %387, %388
  br i1 %267, label %509, label %394

; <label>:394:                                    ; preds = %393
  %395 = select i1 %13, i32 1, i32 2
  %396 = or i32 %16, %395
  %397 = zext i32 %396 to i64
  br label %398

; <label>:398:                                    ; preds = %457, %394
  %399 = phi i64 [ 1, %394 ], [ %402, %457 ]
  %400 = phi i32 [ 0, %394 ], [ %458, %457 ]
  %401 = phi i32 [ 1, %394 ], [ %404, %457 ]
  %402 = add nuw nsw i64 %399, 1
  %403 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %402
  %404 = load i32, i32* %403, align 4, !tbaa !6
  %405 = icmp slt i32 %401, %404
  br i1 %405, label %406, label %457

; <label>:406:                                    ; preds = %398
  %407 = sext i32 %401 to i64
  %408 = sext i32 %404 to i64
  br label %409

; <label>:409:                                    ; preds = %429, %406
  %410 = phi i64 [ %407, %406 ], [ %431, %429 ]
  %411 = phi i32 [ 0, %406 ], [ %430, %429 ]
  %412 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %410
  %413 = load i32, i32* %412, align 4, !tbaa !6
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %414
  %416 = load double, double* %415, align 8, !tbaa !2
  %417 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %410
  %418 = load double, double* %417, align 8, !tbaa !2
  %419 = fadd double %416, %418
  store double %419, double* %415, align 8, !tbaa !2
  %420 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %414
  %421 = load i32, i32* %420, align 4, !tbaa !6
  %422 = icmp eq i32 %421, 0
  %423 = fcmp une double %419, 0.000000e+00
  %424 = and i1 %423, %422
  br i1 %424, label %425, label %429

; <label>:425:                                    ; preds = %409
  store i32 1, i32* %420, align 4, !tbaa !6
  %426 = add nsw i32 %411, 1
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds i32, i32* %212, i64 %427
  store i32 %413, i32* %428, align 4, !tbaa !6
  br label %429

; <label>:429:                                    ; preds = %425, %409
  %430 = phi i32 [ %426, %425 ], [ %411, %409 ]
  %431 = add nsw i64 %410, 1
  %432 = icmp eq i64 %431, %408
  br i1 %432, label %433, label %409

; <label>:433:                                    ; preds = %429
  %434 = icmp slt i32 %430, 1
  br i1 %434, label %457, label %435

; <label>:435:                                    ; preds = %433
  %436 = add i32 %430, 1
  %437 = zext i32 %436 to i64
  br label %438

; <label>:438:                                    ; preds = %453, %435
  %439 = phi i64 [ %455, %453 ], [ 1, %435 ]
  %440 = phi i32 [ %454, %453 ], [ %400, %435 ]
  %441 = getelementptr inbounds i32, i32* %212, i64 %439
  %442 = load i32, i32* %441, align 4, !tbaa !6
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds [28002 x i32], [28002 x i32]* @iv, i64 0, i64 %443
  store i32 0, i32* %444, align 4, !tbaa !6
  %445 = getelementptr inbounds [14002 x double], [14002 x double]* @v, i64 0, i64 %443
  %446 = load double, double* %445, align 8, !tbaa !2
  store double 0.000000e+00, double* %445, align 8, !tbaa !2
  %447 = fcmp une double %446, 0.000000e+00
  br i1 %447, label %448, label %453

; <label>:448:                                    ; preds = %438
  %449 = add nsw i32 %440, 1
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %450
  store double %446, double* %451, align 8, !tbaa !2
  %452 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %450
  store i32 %442, i32* %452, align 4, !tbaa !6
  br label %453

; <label>:453:                                    ; preds = %448, %438
  %454 = phi i32 [ %449, %448 ], [ %440, %438 ]
  %455 = add nuw nsw i64 %439, 1
  %456 = icmp eq i64 %455, %437
  br i1 %456, label %457, label %438

; <label>:457:                                    ; preds = %453, %433, %398
  %458 = phi i32 [ %400, %433 ], [ %400, %398 ], [ %454, %453 ]
  %459 = add nsw i32 %458, 1
  store i32 %459, i32* %403, align 4, !tbaa !6
  %460 = icmp eq i64 %402, %397
  br i1 %460, label %509, label %398

; <label>:461:                                    ; preds = %126
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 2), align 16, !tbaa !2
  br label %462

; <label>:462:                                    ; preds = %461, %126
  %463 = phi i32 [ 1, %461 ], [ %127, %126 ]
  %464 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 3), align 4, !tbaa !6
  %465 = icmp eq i32 %464, %34
  br i1 %465, label %466, label %467

; <label>:466:                                    ; preds = %462
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 3), align 8, !tbaa !2
  br label %467

; <label>:467:                                    ; preds = %466, %462
  %468 = phi i32 [ 1, %466 ], [ %463, %462 ]
  %469 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 4), align 16, !tbaa !6
  %470 = icmp eq i32 %469, %34
  br i1 %470, label %471, label %472

; <label>:471:                                    ; preds = %467
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 4), align 16, !tbaa !2
  br label %472

; <label>:472:                                    ; preds = %471, %467
  %473 = phi i32 [ 1, %471 ], [ %468, %467 ]
  %474 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 5), align 4, !tbaa !6
  %475 = icmp eq i32 %474, %34
  br i1 %475, label %476, label %477

; <label>:476:                                    ; preds = %472
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 5), align 8, !tbaa !2
  br label %477

; <label>:477:                                    ; preds = %476, %472
  %478 = phi i32 [ 1, %476 ], [ %473, %472 ]
  %479 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 6), align 8, !tbaa !6
  %480 = icmp eq i32 %479, %34
  br i1 %480, label %481, label %482

; <label>:481:                                    ; preds = %477
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 6), align 16, !tbaa !2
  br label %482

; <label>:482:                                    ; preds = %481, %477
  %483 = phi i32 [ 1, %481 ], [ %478, %477 ]
  %484 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 7), align 4, !tbaa !6
  %485 = icmp eq i32 %484, %34
  br i1 %485, label %486, label %487

; <label>:486:                                    ; preds = %482
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 7), align 8, !tbaa !2
  br label %487

; <label>:487:                                    ; preds = %486, %482
  %488 = phi i32 [ 1, %486 ], [ %483, %482 ]
  %489 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 8), align 16, !tbaa !6
  %490 = icmp eq i32 %489, %34
  br i1 %490, label %491, label %492

; <label>:491:                                    ; preds = %487
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 8), align 16, !tbaa !2
  br label %492

; <label>:492:                                    ; preds = %491, %487
  %493 = phi i32 [ 1, %491 ], [ %488, %487 ]
  %494 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 9), align 4, !tbaa !6
  %495 = icmp eq i32 %494, %34
  br i1 %495, label %496, label %497

; <label>:496:                                    ; preds = %492
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 9), align 8, !tbaa !2
  br label %497

; <label>:497:                                    ; preds = %496, %492
  %498 = phi i32 [ 1, %496 ], [ %493, %492 ]
  %499 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 10), align 8, !tbaa !6
  %500 = icmp eq i32 %499, %34
  br i1 %500, label %501, label %502

; <label>:501:                                    ; preds = %497
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 10), align 16, !tbaa !2
  br label %502

; <label>:502:                                    ; preds = %501, %497
  %503 = phi i32 [ 1, %501 ], [ %498, %497 ]
  %504 = load i32, i32* getelementptr inbounds ([28002 x i32], [28002 x i32]* @iv, i64 0, i64 11), align 4, !tbaa !6
  %505 = icmp eq i32 %504, %34
  br i1 %505, label %506, label %507

; <label>:506:                                    ; preds = %502
  store double 5.000000e-01, double* getelementptr inbounds ([14002 x double], [14002 x double]* @v, i64 0, i64 11), align 8, !tbaa !2
  br label %131

; <label>:507:                                    ; preds = %502
  %508 = icmp eq i32 %503, 0
  br i1 %508, label %130, label %131

; <label>:509:                                    ; preds = %457, %393
  %510 = load i1, i1* @lastrow, align 4
  %511 = load i1, i1* @firstrow, align 4
  %512 = sext i1 %511 to i32
  %513 = select i1 %510, i32 14001, i32 1
  %514 = add nsw i32 %513, %512
  %515 = icmp slt i32 %514, 1
  br i1 %515, label %611, label %516

; <label>:516:                                    ; preds = %509
  %517 = load i1, i1* @firstcol, align 4
  %518 = sext i1 %517 to i32
  %519 = sext i32 %514 to i64
  %520 = insertelement <4 x i32> undef, i32 %518, i32 0
  %521 = shufflevector <4 x i32> %520, <4 x i32> undef, <4 x i32> zeroinitializer
  %522 = insertelement <4 x i32> undef, i32 %518, i32 0
  %523 = shufflevector <4 x i32> %522, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %524

; <label>:524:                                    ; preds = %609, %516
  %525 = phi i32 [ %529, %609 ], [ 1, %516 ]
  %526 = phi i64 [ %527, %609 ], [ 1, %516 ]
  %527 = add nuw nsw i64 %526, 1
  %528 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %527
  %529 = load i32, i32* %528, align 4, !tbaa !6
  %530 = icmp slt i32 %525, %529
  br i1 %530, label %531, label %609

; <label>:531:                                    ; preds = %524
  %532 = sext i32 %525 to i64
  %533 = sext i32 %529 to i64
  %534 = sext i32 %529 to i64
  %535 = sub nsw i64 %534, %532
  %536 = icmp ult i64 %535, 8
  br i1 %536, label %599, label %537

; <label>:537:                                    ; preds = %531
  %538 = and i64 %535, -8
  %539 = add nsw i64 %538, %532
  %540 = add nsw i64 %538, -8
  %541 = lshr exact i64 %540, 3
  %542 = add nuw nsw i64 %541, 1
  %543 = and i64 %542, 1
  %544 = icmp eq i64 %540, 0
  br i1 %544, label %580, label %545

; <label>:545:                                    ; preds = %537
  %546 = sub nsw i64 %542, %543
  br label %547

; <label>:547:                                    ; preds = %547, %545
  %548 = phi i64 [ 0, %545 ], [ %577, %547 ]
  %549 = phi i64 [ %546, %545 ], [ %578, %547 ]
  %550 = add i64 %548, %532
  %551 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %550
  %552 = bitcast i32* %551 to <4 x i32>*
  %553 = load <4 x i32>, <4 x i32>* %552, align 4, !tbaa !6
  %554 = getelementptr i32, i32* %551, i64 4
  %555 = bitcast i32* %554 to <4 x i32>*
  %556 = load <4 x i32>, <4 x i32>* %555, align 4, !tbaa !6
  %557 = add <4 x i32> %553, <i32 1, i32 1, i32 1, i32 1>
  %558 = add <4 x i32> %556, <i32 1, i32 1, i32 1, i32 1>
  %559 = add <4 x i32> %557, %521
  %560 = add <4 x i32> %558, %523
  %561 = bitcast i32* %551 to <4 x i32>*
  store <4 x i32> %559, <4 x i32>* %561, align 4, !tbaa !6
  %562 = bitcast i32* %554 to <4 x i32>*
  store <4 x i32> %560, <4 x i32>* %562, align 4, !tbaa !6
  %563 = or i64 %548, 8
  %564 = add i64 %563, %532
  %565 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %564
  %566 = bitcast i32* %565 to <4 x i32>*
  %567 = load <4 x i32>, <4 x i32>* %566, align 4, !tbaa !6
  %568 = getelementptr i32, i32* %565, i64 4
  %569 = bitcast i32* %568 to <4 x i32>*
  %570 = load <4 x i32>, <4 x i32>* %569, align 4, !tbaa !6
  %571 = add <4 x i32> %567, <i32 1, i32 1, i32 1, i32 1>
  %572 = add <4 x i32> %570, <i32 1, i32 1, i32 1, i32 1>
  %573 = add <4 x i32> %571, %521
  %574 = add <4 x i32> %572, %523
  %575 = bitcast i32* %565 to <4 x i32>*
  store <4 x i32> %573, <4 x i32>* %575, align 4, !tbaa !6
  %576 = bitcast i32* %568 to <4 x i32>*
  store <4 x i32> %574, <4 x i32>* %576, align 4, !tbaa !6
  %577 = add i64 %548, 16
  %578 = add i64 %549, -2
  %579 = icmp eq i64 %578, 0
  br i1 %579, label %580, label %547, !llvm.loop !10

; <label>:580:                                    ; preds = %547, %537
  %581 = phi i64 [ 0, %537 ], [ %577, %547 ]
  %582 = icmp eq i64 %543, 0
  br i1 %582, label %597, label %583

; <label>:583:                                    ; preds = %580
  %584 = add i64 %581, %532
  %585 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %584
  %586 = bitcast i32* %585 to <4 x i32>*
  %587 = load <4 x i32>, <4 x i32>* %586, align 4, !tbaa !6
  %588 = getelementptr i32, i32* %585, i64 4
  %589 = bitcast i32* %588 to <4 x i32>*
  %590 = load <4 x i32>, <4 x i32>* %589, align 4, !tbaa !6
  %591 = add <4 x i32> %587, <i32 1, i32 1, i32 1, i32 1>
  %592 = add <4 x i32> %590, <i32 1, i32 1, i32 1, i32 1>
  %593 = add <4 x i32> %591, %521
  %594 = add <4 x i32> %592, %523
  %595 = bitcast i32* %585 to <4 x i32>*
  store <4 x i32> %593, <4 x i32>* %595, align 4, !tbaa !6
  %596 = bitcast i32* %588 to <4 x i32>*
  store <4 x i32> %594, <4 x i32>* %596, align 4, !tbaa !6
  br label %597

; <label>:597:                                    ; preds = %580, %583
  %598 = icmp eq i64 %535, %538
  br i1 %598, label %609, label %599

; <label>:599:                                    ; preds = %597, %531
  %600 = phi i64 [ %532, %531 ], [ %539, %597 ]
  br label %601

; <label>:601:                                    ; preds = %599, %601
  %602 = phi i64 [ %607, %601 ], [ %600, %599 ]
  %603 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %602
  %604 = load i32, i32* %603, align 4, !tbaa !6
  %605 = add i32 %604, 1
  %606 = add i32 %605, %518
  store i32 %606, i32* %603, align 4, !tbaa !6
  %607 = add nsw i64 %602, 1
  %608 = icmp slt i64 %607, %533
  br i1 %608, label %601, label %609, !llvm.loop !12

; <label>:609:                                    ; preds = %601, %597, %524
  %610 = icmp slt i64 %526, %519
  br i1 %610, label %524, label %611

; <label>:611:                                    ; preds = %609, %509
  br label %612

; <label>:612:                                    ; preds = %612, %611
  %613 = phi i64 [ 0, %611 ], [ %643, %612 ]
  %614 = or i64 %613, 1
  %615 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %614
  %616 = bitcast double* %615 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %616, align 8, !tbaa !2
  %617 = getelementptr double, double* %615, i64 2
  %618 = bitcast double* %617 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %618, align 8, !tbaa !2
  %619 = add nuw nsw i64 %613, 4
  %620 = or i64 %619, 1
  %621 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %620
  %622 = bitcast double* %621 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %622, align 8, !tbaa !2
  %623 = getelementptr double, double* %621, i64 2
  %624 = bitcast double* %623 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %624, align 8, !tbaa !2
  %625 = add nuw nsw i64 %613, 8
  %626 = or i64 %625, 1
  %627 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %626
  %628 = bitcast double* %627 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %628, align 8, !tbaa !2
  %629 = getelementptr double, double* %627, i64 2
  %630 = bitcast double* %629 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %630, align 8, !tbaa !2
  %631 = add nuw nsw i64 %613, 12
  %632 = or i64 %631, 1
  %633 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %632
  %634 = bitcast double* %633 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %634, align 8, !tbaa !2
  %635 = getelementptr double, double* %633, i64 2
  %636 = bitcast double* %635 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %636, align 8, !tbaa !2
  %637 = add nuw nsw i64 %613, 16
  %638 = or i64 %637, 1
  %639 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %638
  %640 = bitcast double* %639 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %640, align 8, !tbaa !2
  %641 = getelementptr double, double* %639, i64 2
  %642 = bitcast double* %641 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %642, align 8, !tbaa !2
  %643 = add nuw nsw i64 %613, 20
  %644 = icmp eq i64 %643, 14000
  br i1 %644, label %645, label %612, !llvm.loop !14

; <label>:645:                                    ; preds = %612
  store double 1.000000e+00, double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i64 0, i64 14001), align 8, !tbaa !2
  %646 = load i1, i1* @lastcol, align 4
  %647 = load i1, i1* @firstcol, align 4
  %648 = sext i1 %647 to i32
  %649 = select i1 %646, i32 14001, i32 1
  %650 = add nsw i32 %649, %648
  %651 = icmp slt i32 %650, 1
  br i1 %651, label %655, label %652

; <label>:652:                                    ; preds = %645
  %653 = zext i32 %650 to i64
  %654 = shl nuw nsw i64 %653, 3
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @q, i64 0, i64 1) to i8*), i8 0, i64 %654, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @z, i64 0, i64 1) to i8*), i8 0, i64 %654, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @r, i64 0, i64 1) to i8*), i8 0, i64 %654, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @p, i64 0, i64 1) to i8*), i8 0, i64 %654, i32 8, i1 false)
  br label %655

; <label>:655:                                    ; preds = %652, %645
  call fastcc void @conj_grad(double* nonnull %3)
  %656 = load i1, i1* @lastcol, align 4
  %657 = load i1, i1* @firstcol, align 4
  %658 = sext i1 %657 to i32
  %659 = select i1 %656, i32 14001, i32 1
  %660 = add nsw i32 %659, %658
  %661 = icmp slt i32 %660, 1
  br i1 %661, label %712, label %662

; <label>:662:                                    ; preds = %655
  %663 = sext i32 %660 to i64
  %664 = add nsw i64 %663, -1
  %665 = and i64 %663, 3
  %666 = icmp ult i64 %664, 3
  br i1 %666, label %695, label %667

; <label>:667:                                    ; preds = %662
  %668 = sub nsw i64 %663, %665
  br label %669

; <label>:669:                                    ; preds = %669, %667
  %670 = phi i64 [ 1, %667 ], [ %692, %669 ]
  %671 = phi double [ 0.000000e+00, %667 ], [ %691, %669 ]
  %672 = phi i64 [ %668, %667 ], [ %693, %669 ]
  %673 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %670
  %674 = load double, double* %673, align 8, !tbaa !2
  %675 = fmul double %674, %674
  %676 = fadd double %671, %675
  %677 = add nuw nsw i64 %670, 1
  %678 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %677
  %679 = load double, double* %678, align 8, !tbaa !2
  %680 = fmul double %679, %679
  %681 = fadd double %676, %680
  %682 = add nuw nsw i64 %670, 2
  %683 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %682
  %684 = load double, double* %683, align 8, !tbaa !2
  %685 = fmul double %684, %684
  %686 = fadd double %681, %685
  %687 = add nuw nsw i64 %670, 3
  %688 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %687
  %689 = load double, double* %688, align 8, !tbaa !2
  %690 = fmul double %689, %689
  %691 = fadd double %686, %690
  %692 = add nuw nsw i64 %670, 4
  %693 = add i64 %672, -4
  %694 = icmp eq i64 %693, 0
  br i1 %694, label %695, label %669

; <label>:695:                                    ; preds = %669, %662
  %696 = phi double [ undef, %662 ], [ %691, %669 ]
  %697 = phi i64 [ 1, %662 ], [ %692, %669 ]
  %698 = phi double [ 0.000000e+00, %662 ], [ %691, %669 ]
  %699 = icmp eq i64 %665, 0
  br i1 %699, label %712, label %700

; <label>:700:                                    ; preds = %695
  br label %701

; <label>:701:                                    ; preds = %701, %700
  %702 = phi i64 [ %709, %701 ], [ %697, %700 ]
  %703 = phi double [ %708, %701 ], [ %698, %700 ]
  %704 = phi i64 [ %710, %701 ], [ %665, %700 ]
  %705 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %702
  %706 = load double, double* %705, align 8, !tbaa !2
  %707 = fmul double %706, %706
  %708 = fadd double %703, %707
  %709 = add nuw nsw i64 %702, 1
  %710 = add i64 %704, -1
  %711 = icmp eq i64 %710, 0
  br i1 %711, label %712, label %701, !llvm.loop !15

; <label>:712:                                    ; preds = %695, %701, %655
  %713 = phi double [ 0.000000e+00, %655 ], [ %696, %695 ], [ %708, %701 ]
  %714 = tail call double @sqrt(double %713) #6
  %715 = fdiv double 1.000000e+00, %714
  %716 = load i1, i1* @lastcol, align 4
  %717 = load i1, i1* @firstcol, align 4
  %718 = sext i1 %717 to i32
  %719 = select i1 %716, i32 14001, i32 1
  %720 = add nsw i32 %719, %718
  %721 = icmp slt i32 %720, 1
  br i1 %721, label %801, label %722

; <label>:722:                                    ; preds = %712
  %723 = sext i32 %720 to i64
  %724 = icmp ult i32 %720, 4
  br i1 %724, label %791, label %725

; <label>:725:                                    ; preds = %722
  %726 = and i64 %723, -4
  %727 = or i64 %726, 1
  %728 = insertelement <2 x double> undef, double %715, i32 0
  %729 = shufflevector <2 x double> %728, <2 x double> undef, <2 x i32> zeroinitializer
  %730 = insertelement <2 x double> undef, double %715, i32 0
  %731 = shufflevector <2 x double> %730, <2 x double> undef, <2 x i32> zeroinitializer
  %732 = add nsw i64 %726, -4
  %733 = lshr exact i64 %732, 2
  %734 = add nuw nsw i64 %733, 1
  %735 = and i64 %734, 1
  %736 = icmp eq i64 %732, 0
  br i1 %736, label %773, label %737

; <label>:737:                                    ; preds = %725
  %738 = sub nsw i64 %734, %735
  br label %739

; <label>:739:                                    ; preds = %739, %737
  %740 = phi i64 [ 0, %737 ], [ %768, %739 ]
  %741 = phi i64 [ %738, %737 ], [ %769, %739 ]
  %742 = or i64 %740, 1
  %743 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %742
  %744 = bitcast double* %743 to <2 x double>*
  %745 = load <2 x double>, <2 x double>* %744, align 8, !tbaa !2
  %746 = getelementptr double, double* %743, i64 2
  %747 = bitcast double* %746 to <2 x double>*
  %748 = load <2 x double>, <2 x double>* %747, align 8, !tbaa !2
  %749 = fmul <2 x double> %729, %745
  %750 = fmul <2 x double> %731, %748
  %751 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %742
  %752 = bitcast double* %751 to <2 x double>*
  store <2 x double> %749, <2 x double>* %752, align 8, !tbaa !2
  %753 = getelementptr double, double* %751, i64 2
  %754 = bitcast double* %753 to <2 x double>*
  store <2 x double> %750, <2 x double>* %754, align 8, !tbaa !2
  %755 = or i64 %740, 5
  %756 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %755
  %757 = bitcast double* %756 to <2 x double>*
  %758 = load <2 x double>, <2 x double>* %757, align 8, !tbaa !2
  %759 = getelementptr double, double* %756, i64 2
  %760 = bitcast double* %759 to <2 x double>*
  %761 = load <2 x double>, <2 x double>* %760, align 8, !tbaa !2
  %762 = fmul <2 x double> %729, %758
  %763 = fmul <2 x double> %731, %761
  %764 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %755
  %765 = bitcast double* %764 to <2 x double>*
  store <2 x double> %762, <2 x double>* %765, align 8, !tbaa !2
  %766 = getelementptr double, double* %764, i64 2
  %767 = bitcast double* %766 to <2 x double>*
  store <2 x double> %763, <2 x double>* %767, align 8, !tbaa !2
  %768 = add i64 %740, 8
  %769 = add i64 %741, -2
  %770 = icmp eq i64 %769, 0
  br i1 %770, label %771, label %739, !llvm.loop !16

; <label>:771:                                    ; preds = %739
  %772 = or i64 %768, 1
  br label %773

; <label>:773:                                    ; preds = %771, %725
  %774 = phi i64 [ 1, %725 ], [ %772, %771 ]
  %775 = icmp eq i64 %735, 0
  br i1 %775, label %789, label %776

; <label>:776:                                    ; preds = %773
  %777 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %774
  %778 = bitcast double* %777 to <2 x double>*
  %779 = load <2 x double>, <2 x double>* %778, align 8, !tbaa !2
  %780 = getelementptr double, double* %777, i64 2
  %781 = bitcast double* %780 to <2 x double>*
  %782 = load <2 x double>, <2 x double>* %781, align 8, !tbaa !2
  %783 = fmul <2 x double> %729, %779
  %784 = fmul <2 x double> %731, %782
  %785 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %774
  %786 = bitcast double* %785 to <2 x double>*
  store <2 x double> %783, <2 x double>* %786, align 8, !tbaa !2
  %787 = getelementptr double, double* %785, i64 2
  %788 = bitcast double* %787 to <2 x double>*
  store <2 x double> %784, <2 x double>* %788, align 8, !tbaa !2
  br label %789

; <label>:789:                                    ; preds = %773, %776
  %790 = icmp eq i64 %726, %723
  br i1 %790, label %801, label %791

; <label>:791:                                    ; preds = %789, %722
  %792 = phi i64 [ 1, %722 ], [ %727, %789 ]
  br label %793

; <label>:793:                                    ; preds = %791, %793
  %794 = phi i64 [ %799, %793 ], [ %792, %791 ]
  %795 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %794
  %796 = load double, double* %795, align 8, !tbaa !2
  %797 = fmul double %715, %796
  %798 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %794
  store double %797, double* %798, align 8, !tbaa !2
  %799 = add nuw nsw i64 %794, 1
  %800 = icmp slt i64 %794, %723
  br i1 %800, label %793, label %801, !llvm.loop !17

; <label>:801:                                    ; preds = %793, %712, %789
  br label %802

; <label>:802:                                    ; preds = %802, %801
  %803 = phi i64 [ 0, %801 ], [ %833, %802 ]
  %804 = or i64 %803, 1
  %805 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %804
  %806 = bitcast double* %805 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %806, align 8, !tbaa !2
  %807 = getelementptr double, double* %805, i64 2
  %808 = bitcast double* %807 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %808, align 8, !tbaa !2
  %809 = add nuw nsw i64 %803, 4
  %810 = or i64 %809, 1
  %811 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %810
  %812 = bitcast double* %811 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %812, align 8, !tbaa !2
  %813 = getelementptr double, double* %811, i64 2
  %814 = bitcast double* %813 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %814, align 8, !tbaa !2
  %815 = add nuw nsw i64 %803, 8
  %816 = or i64 %815, 1
  %817 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %816
  %818 = bitcast double* %817 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %818, align 8, !tbaa !2
  %819 = getelementptr double, double* %817, i64 2
  %820 = bitcast double* %819 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %820, align 8, !tbaa !2
  %821 = add nuw nsw i64 %803, 12
  %822 = or i64 %821, 1
  %823 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %822
  %824 = bitcast double* %823 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %824, align 8, !tbaa !2
  %825 = getelementptr double, double* %823, i64 2
  %826 = bitcast double* %825 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %826, align 8, !tbaa !2
  %827 = add nuw nsw i64 %803, 16
  %828 = or i64 %827, 1
  %829 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %828
  %830 = bitcast double* %829 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %830, align 8, !tbaa !2
  %831 = getelementptr double, double* %829, i64 2
  %832 = bitcast double* %831 to <2 x double>*
  store <2 x double> <double 1.000000e+00, double 1.000000e+00>, <2 x double>* %832, align 8, !tbaa !2
  %833 = add nuw nsw i64 %803, 20
  %834 = icmp eq i64 %833, 14000
  br i1 %834, label %835, label %802, !llvm.loop !18

; <label>:835:                                    ; preds = %802
  store double 1.000000e+00, double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i64 0, i64 14001), align 8, !tbaa !2
  tail call void @timer_clear(i32 1) #6
  tail call void @timer_start(i32 1) #6
  br label %836

; <label>:836:                                    ; preds = %992, %835
  %837 = phi i32 [ 1, %835 ], [ %993, %992 ]
  call fastcc void @conj_grad(double* nonnull %3)
  %838 = load i1, i1* @lastcol, align 4
  %839 = load i1, i1* @firstcol, align 4
  %840 = sext i1 %839 to i32
  %841 = select i1 %838, i32 14001, i32 1
  %842 = add nsw i32 %841, %840
  %843 = icmp slt i32 %842, 1
  br i1 %843, label %894, label %844

; <label>:844:                                    ; preds = %836
  %845 = sext i32 %842 to i64
  %846 = and i64 %845, 1
  %847 = icmp eq i32 %842, 1
  br i1 %847, label %878, label %848

; <label>:848:                                    ; preds = %844
  %849 = sub nsw i64 %845, %846
  br label %850

; <label>:850:                                    ; preds = %850, %848
  %851 = phi i64 [ 1, %848 ], [ %875, %850 ]
  %852 = phi <2 x double> [ zeroinitializer, %848 ], [ %874, %850 ]
  %853 = phi i64 [ %849, %848 ], [ %876, %850 ]
  %854 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %851
  %855 = load double, double* %854, align 8, !tbaa !2
  %856 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %851
  %857 = load double, double* %856, align 8, !tbaa !2
  %858 = insertelement <2 x double> undef, double %855, i32 0
  %859 = insertelement <2 x double> %858, double %857, i32 1
  %860 = insertelement <2 x double> undef, double %857, i32 0
  %861 = shufflevector <2 x double> %860, <2 x double> undef, <2 x i32> zeroinitializer
  %862 = fmul <2 x double> %859, %861
  %863 = fadd <2 x double> %852, %862
  %864 = add nuw nsw i64 %851, 1
  %865 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %864
  %866 = load double, double* %865, align 8, !tbaa !2
  %867 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %864
  %868 = load double, double* %867, align 8, !tbaa !2
  %869 = insertelement <2 x double> undef, double %866, i32 0
  %870 = insertelement <2 x double> %869, double %868, i32 1
  %871 = insertelement <2 x double> undef, double %868, i32 0
  %872 = shufflevector <2 x double> %871, <2 x double> undef, <2 x i32> zeroinitializer
  %873 = fmul <2 x double> %870, %872
  %874 = fadd <2 x double> %863, %873
  %875 = add nuw nsw i64 %851, 2
  %876 = add i64 %853, -2
  %877 = icmp eq i64 %876, 0
  br i1 %877, label %878, label %850

; <label>:878:                                    ; preds = %850, %844
  %879 = phi <2 x double> [ undef, %844 ], [ %874, %850 ]
  %880 = phi i64 [ 1, %844 ], [ %875, %850 ]
  %881 = phi <2 x double> [ zeroinitializer, %844 ], [ %874, %850 ]
  %882 = icmp eq i64 %846, 0
  br i1 %882, label %894, label %883

; <label>:883:                                    ; preds = %878
  %884 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %880
  %885 = load double, double* %884, align 8, !tbaa !2
  %886 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %880
  %887 = load double, double* %886, align 8, !tbaa !2
  %888 = insertelement <2 x double> undef, double %887, i32 0
  %889 = insertelement <2 x double> %888, double %885, i32 1
  %890 = insertelement <2 x double> undef, double %885, i32 0
  %891 = shufflevector <2 x double> %890, <2 x double> undef, <2 x i32> zeroinitializer
  %892 = fmul <2 x double> %889, %891
  %893 = fadd <2 x double> %881, %892
  br label %894

; <label>:894:                                    ; preds = %883, %878, %836
  %895 = phi <2 x double> [ zeroinitializer, %836 ], [ %879, %878 ], [ %893, %883 ]
  %896 = extractelement <2 x double> %895, i32 1
  %897 = tail call double @sqrt(double %896) #6
  %898 = fdiv double 1.000000e+00, %897
  %899 = extractelement <2 x double> %895, i32 0
  %900 = fdiv double 1.000000e+00, %899
  %901 = fadd double %900, 2.000000e+01
  %902 = icmp eq i32 %837, 1
  br i1 %902, label %903, label %905

; <label>:903:                                    ; preds = %894
  %904 = tail call i32 @puts(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @str.30, i64 0, i64 0))
  br label %905

; <label>:905:                                    ; preds = %903, %894
  %906 = load double, double* %3, align 8, !tbaa !2
  %907 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i64 0, i64 0), i32 %837, double %906, double %901)
  %908 = load i1, i1* @lastcol, align 4
  %909 = load i1, i1* @firstcol, align 4
  %910 = sext i1 %909 to i32
  %911 = select i1 %908, i32 14001, i32 1
  %912 = add nsw i32 %911, %910
  %913 = icmp slt i32 %912, 1
  br i1 %913, label %992, label %914

; <label>:914:                                    ; preds = %905
  %915 = sext i32 %912 to i64
  %916 = icmp ult i32 %912, 4
  br i1 %916, label %982, label %917

; <label>:917:                                    ; preds = %914
  %918 = and i64 %915, -4
  %919 = or i64 %918, 1
  %920 = insertelement <2 x double> undef, double %898, i32 0
  %921 = shufflevector <2 x double> %920, <2 x double> undef, <2 x i32> zeroinitializer
  %922 = insertelement <2 x double> undef, double %898, i32 0
  %923 = shufflevector <2 x double> %922, <2 x double> undef, <2 x i32> zeroinitializer
  %924 = add nsw i64 %918, -4
  %925 = lshr exact i64 %924, 2
  %926 = add nuw nsw i64 %925, 1
  %927 = and i64 %926, 1
  %928 = icmp eq i64 %924, 0
  br i1 %928, label %963, label %929

; <label>:929:                                    ; preds = %917
  %930 = sub nsw i64 %926, %927
  br label %931

; <label>:931:                                    ; preds = %931, %929
  %932 = phi i64 [ 0, %929 ], [ %960, %931 ]
  %933 = phi i64 [ %930, %929 ], [ %961, %931 ]
  %934 = or i64 %932, 1
  %935 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %934
  %936 = bitcast double* %935 to <2 x double>*
  %937 = load <2 x double>, <2 x double>* %936, align 8, !tbaa !2
  %938 = getelementptr double, double* %935, i64 2
  %939 = bitcast double* %938 to <2 x double>*
  %940 = load <2 x double>, <2 x double>* %939, align 8, !tbaa !2
  %941 = fmul <2 x double> %921, %937
  %942 = fmul <2 x double> %923, %940
  %943 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %934
  %944 = bitcast double* %943 to <2 x double>*
  store <2 x double> %941, <2 x double>* %944, align 8, !tbaa !2
  %945 = getelementptr double, double* %943, i64 2
  %946 = bitcast double* %945 to <2 x double>*
  store <2 x double> %942, <2 x double>* %946, align 8, !tbaa !2
  %947 = or i64 %932, 5
  %948 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %947
  %949 = bitcast double* %948 to <2 x double>*
  %950 = load <2 x double>, <2 x double>* %949, align 8, !tbaa !2
  %951 = getelementptr double, double* %948, i64 2
  %952 = bitcast double* %951 to <2 x double>*
  %953 = load <2 x double>, <2 x double>* %952, align 8, !tbaa !2
  %954 = fmul <2 x double> %921, %950
  %955 = fmul <2 x double> %923, %953
  %956 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %947
  %957 = bitcast double* %956 to <2 x double>*
  store <2 x double> %954, <2 x double>* %957, align 8, !tbaa !2
  %958 = getelementptr double, double* %956, i64 2
  %959 = bitcast double* %958 to <2 x double>*
  store <2 x double> %955, <2 x double>* %959, align 8, !tbaa !2
  %960 = add i64 %932, 8
  %961 = add i64 %933, -2
  %962 = icmp eq i64 %961, 0
  br i1 %962, label %963, label %931, !llvm.loop !19

; <label>:963:                                    ; preds = %931, %917
  %964 = phi i64 [ 0, %917 ], [ %960, %931 ]
  %965 = icmp eq i64 %927, 0
  br i1 %965, label %980, label %966

; <label>:966:                                    ; preds = %963
  %967 = or i64 %964, 1
  %968 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %967
  %969 = bitcast double* %968 to <2 x double>*
  %970 = load <2 x double>, <2 x double>* %969, align 8, !tbaa !2
  %971 = getelementptr double, double* %968, i64 2
  %972 = bitcast double* %971 to <2 x double>*
  %973 = load <2 x double>, <2 x double>* %972, align 8, !tbaa !2
  %974 = fmul <2 x double> %921, %970
  %975 = fmul <2 x double> %923, %973
  %976 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %967
  %977 = bitcast double* %976 to <2 x double>*
  store <2 x double> %974, <2 x double>* %977, align 8, !tbaa !2
  %978 = getelementptr double, double* %976, i64 2
  %979 = bitcast double* %978 to <2 x double>*
  store <2 x double> %975, <2 x double>* %979, align 8, !tbaa !2
  br label %980

; <label>:980:                                    ; preds = %963, %966
  %981 = icmp eq i64 %918, %915
  br i1 %981, label %992, label %982

; <label>:982:                                    ; preds = %980, %914
  %983 = phi i64 [ 1, %914 ], [ %919, %980 ]
  br label %984

; <label>:984:                                    ; preds = %982, %984
  %985 = phi i64 [ %990, %984 ], [ %983, %982 ]
  %986 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %985
  %987 = load double, double* %986, align 8, !tbaa !2
  %988 = fmul double %898, %987
  %989 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %985
  store double %988, double* %989, align 8, !tbaa !2
  %990 = add nuw nsw i64 %985, 1
  %991 = icmp slt i64 %985, %915
  br i1 %991, label %984, label %992, !llvm.loop !20

; <label>:992:                                    ; preds = %984, %980, %905
  %993 = add nuw nsw i32 %837, 1
  %994 = icmp eq i32 %993, 16
  br i1 %994, label %995, label %836

; <label>:995:                                    ; preds = %992
  tail call void @timer_stop(i32 1) #6
  %996 = tail call double @timer_read(i32 1) #6
  %997 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.27, i64 0, i64 0))
  %998 = fadd double %901, 0xC031215715A1D8EC
  %999 = tail call double @llvm.fabs.f64(double %998)
  %1000 = fcmp ugt double %999, 1.000000e-10
  br i1 %1000, label %1005, label %1001

; <label>:1001:                                   ; preds = %995
  %1002 = tail call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str.29, i64 0, i64 0))
  %1003 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.7, i64 0, i64 0), double %901)
  %1004 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.8, i64 0, i64 0), double %998)
  br label %1009

; <label>:1005:                                   ; preds = %995
  %1006 = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str.28, i64 0, i64 0))
  %1007 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.10, i64 0, i64 0), double %901)
  %1008 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i64 0, i64 0), double 0x4031215715A1D8EC)
  br label %1009

; <label>:1009:                                   ; preds = %1001, %1005
  %1010 = phi i32 [ 1, %1001 ], [ 0, %1005 ]
  %1011 = fcmp une double %996, 0.000000e+00
  br i1 %1011, label %1012, label %1015

; <label>:1012:                                   ; preds = %1009
  %1013 = fdiv double 1.496460e+09, %996
  %1014 = fdiv double %1013, 1.000000e+06
  br label %1015

; <label>:1015:                                   ; preds = %1009, %1012
  %1016 = phi double [ %1014, %1012 ], [ 0.000000e+00, %1009 ]
  tail call void @c_print_results(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i64 0, i64 0), i8 signext 65, i32 14000, i32 0, i32 0, i32 15, i32 1, double %996, double %1016, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.15, i64 0, i64 0), i32 %1010, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.23, i64 0, i64 0)) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #6
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare double @randlc(double*, double) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define internal fastcc void @conj_grad(double* nocapture) unnamed_addr #0 {
  %2 = load i1, i1* @naa, align 4
  %3 = select i1 %2, i64 112008, i64 8
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @q, i64 0, i64 1) to i8*), i8 0, i64 %3, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @z, i64 0, i64 1) to i8*), i8 0, i64 %3, i32 8, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @r, i64 0, i64 1) to i8*), i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i64 0, i64 1) to i8*), i64 %3, i32 8, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @p, i64 0, i64 1) to i8*), i8* bitcast (double* getelementptr inbounds ([14003 x double], [14003 x double]* @x, i64 0, i64 1) to i8*), i64 %3, i32 8, i1 false)
  %4 = load i1, i1* @lastcol, align 4
  %5 = select i1 %4, i32 14000, i32 0
  %6 = load i1, i1* @firstcol, align 4
  %7 = zext i1 %6 to i32
  %8 = sub nsw i32 %5, %7
  %9 = icmp slt i32 %8, 0
  %10 = sext i32 %8 to i64
  br i1 %9, label %21, label %11

; <label>:11:                                     ; preds = %1
  br label %12

; <label>:12:                                     ; preds = %11, %12
  %13 = phi i64 [ %19, %12 ], [ 1, %11 ]
  %14 = phi double [ %18, %12 ], [ 0.000000e+00, %11 ]
  %15 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %13
  %16 = load double, double* %15, align 8, !tbaa !2
  %17 = fmul double %16, %16
  %18 = fadd double %14, %17
  %19 = add nuw nsw i64 %13, 1
  %20 = icmp sgt i64 %13, %10
  br i1 %20, label %21, label %12

; <label>:21:                                     ; preds = %12, %1
  %22 = phi double [ 0.000000e+00, %1 ], [ %18, %12 ]
  %23 = load i1, i1* @lastrow, align 4
  %24 = load i1, i1* @firstrow, align 4
  %25 = sext i1 %24 to i32
  %26 = select i1 %23, i32 14001, i32 1
  %27 = add nsw i32 %26, %25
  %28 = icmp slt i32 %27, 1
  %29 = load i32, i32* @conj_grad.callcount, align 4, !tbaa !6
  %30 = sext i32 %27 to i64
  %31 = load i32, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4
  %32 = or i32 %5, 1
  %33 = zext i32 %32 to i64
  %34 = zext i1 %6 to i64
  %35 = sub nsw i64 %33, %34
  %36 = icmp sgt i64 %35, 1
  %37 = select i1 %36, i64 %35, i64 1
  %38 = and i64 %37, 14000
  %39 = add nsw i64 %38, -4
  %40 = lshr exact i64 %39, 2
  %41 = add nuw nsw i64 %40, 1
  %42 = icmp ult i64 %37, 4
  %43 = and i64 %37, 14000
  %44 = or i64 %43, 1
  %45 = icmp eq i64 %37, %43
  br label %46

; <label>:46:                                     ; preds = %236, %21
  %47 = phi i32 [ 1, %21 ], [ %238, %236 ]
  %48 = phi double [ %22, %21 ], [ %237, %236 ]
  br i1 %28, label %136, label %49

; <label>:49:                                     ; preds = %46
  br label %50

; <label>:50:                                     ; preds = %49, %132
  %51 = phi i32 [ %55, %132 ], [ %31, %49 ]
  %52 = phi i64 [ %53, %132 ], [ 1, %49 ]
  %53 = add nuw nsw i64 %52, 1
  %54 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %53
  %55 = load i32, i32* %54, align 4, !tbaa !6
  %56 = icmp slt i32 %51, %55
  br i1 %56, label %57, label %132

; <label>:57:                                     ; preds = %50
  %58 = sext i32 %51 to i64
  %59 = sext i32 %55 to i64
  %60 = sub nsw i64 %59, %58
  %61 = add nsw i64 %59, -1
  %62 = sub nsw i64 %61, %58
  %63 = and i64 %60, 3
  %64 = icmp eq i64 %63, 0
  br i1 %64, label %82, label %65

; <label>:65:                                     ; preds = %57
  br label %66

; <label>:66:                                     ; preds = %66, %65
  %67 = phi i64 [ %58, %65 ], [ %79, %66 ]
  %68 = phi double [ 0.000000e+00, %65 ], [ %78, %66 ]
  %69 = phi i64 [ %63, %65 ], [ %80, %66 ]
  %70 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %67
  %71 = load double, double* %70, align 8, !tbaa !2
  %72 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %67
  %73 = load i32, i32* %72, align 4, !tbaa !6
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %74
  %76 = load double, double* %75, align 8, !tbaa !2
  %77 = fmul double %71, %76
  %78 = fadd double %68, %77
  %79 = add nsw i64 %67, 1
  %80 = add i64 %69, -1
  %81 = icmp eq i64 %80, 0
  br i1 %81, label %82, label %66, !llvm.loop !21

; <label>:82:                                     ; preds = %66, %57
  %83 = phi i64 [ %58, %57 ], [ %79, %66 ]
  %84 = phi double [ 0.000000e+00, %57 ], [ %78, %66 ]
  %85 = phi double [ undef, %57 ], [ %78, %66 ]
  %86 = icmp ult i64 %62, 3
  br i1 %86, label %132, label %87

; <label>:87:                                     ; preds = %82
  br label %88

; <label>:88:                                     ; preds = %88, %87
  %89 = phi i64 [ %83, %87 ], [ %130, %88 ]
  %90 = phi double [ %84, %87 ], [ %129, %88 ]
  %91 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %89
  %92 = load double, double* %91, align 8, !tbaa !2
  %93 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %89
  %94 = load i32, i32* %93, align 4, !tbaa !6
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %95
  %97 = load double, double* %96, align 8, !tbaa !2
  %98 = fmul double %92, %97
  %99 = fadd double %90, %98
  %100 = add nsw i64 %89, 1
  %101 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %100
  %102 = load double, double* %101, align 8, !tbaa !2
  %103 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %100
  %104 = load i32, i32* %103, align 4, !tbaa !6
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %105
  %107 = load double, double* %106, align 8, !tbaa !2
  %108 = fmul double %102, %107
  %109 = fadd double %99, %108
  %110 = add nsw i64 %89, 2
  %111 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %110
  %112 = load double, double* %111, align 8, !tbaa !2
  %113 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %110
  %114 = load i32, i32* %113, align 4, !tbaa !6
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %115
  %117 = load double, double* %116, align 8, !tbaa !2
  %118 = fmul double %112, %117
  %119 = fadd double %109, %118
  %120 = add nsw i64 %89, 3
  %121 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %120
  %122 = load double, double* %121, align 8, !tbaa !2
  %123 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %120
  %124 = load i32, i32* %123, align 4, !tbaa !6
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %125
  %127 = load double, double* %126, align 8, !tbaa !2
  %128 = fmul double %122, %127
  %129 = fadd double %119, %128
  %130 = add nsw i64 %89, 4
  %131 = icmp slt i64 %130, %59
  br i1 %131, label %88, label %132

; <label>:132:                                    ; preds = %82, %88, %50
  %133 = phi double [ 0.000000e+00, %50 ], [ %85, %82 ], [ %129, %88 ]
  %134 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %52
  store double %133, double* %134, align 8, !tbaa !2
  %135 = icmp slt i64 %52, %30
  br i1 %135, label %50, label %136

; <label>:136:                                    ; preds = %132, %46
  br i1 %9, label %236, label %137

; <label>:137:                                    ; preds = %136
  br label %138

; <label>:138:                                    ; preds = %137, %138
  %139 = phi i64 [ %147, %138 ], [ 1, %137 ]
  %140 = phi double [ %146, %138 ], [ 0.000000e+00, %137 ]
  %141 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %139
  %142 = load double, double* %141, align 8, !tbaa !2
  %143 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %139
  %144 = load double, double* %143, align 8, !tbaa !2
  %145 = fmul double %142, %144
  %146 = fadd double %140, %145
  %147 = add nuw nsw i64 %139, 1
  %148 = icmp sgt i64 %139, %10
  br i1 %148, label %149, label %138

; <label>:149:                                    ; preds = %138
  %150 = fdiv double %48, %146
  br i1 %9, label %236, label %151

; <label>:151:                                    ; preds = %149
  br label %152

; <label>:152:                                    ; preds = %151, %152
  %153 = phi i64 [ %169, %152 ], [ 1, %151 ]
  %154 = phi double [ %168, %152 ], [ 0.000000e+00, %151 ]
  %155 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %153
  %156 = load double, double* %155, align 8, !tbaa !2
  %157 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %153
  %158 = load double, double* %157, align 8, !tbaa !2
  %159 = fmul double %150, %158
  %160 = fadd double %156, %159
  store double %160, double* %155, align 8, !tbaa !2
  %161 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %153
  %162 = load double, double* %161, align 8, !tbaa !2
  %163 = getelementptr inbounds [14003 x double], [14003 x double]* @q, i64 0, i64 %153
  %164 = load double, double* %163, align 8, !tbaa !2
  %165 = fmul double %150, %164
  %166 = fsub double %162, %165
  store double %166, double* %161, align 8, !tbaa !2
  %167 = fmul double %166, %166
  %168 = fadd double %154, %167
  %169 = add nuw nsw i64 %153, 1
  %170 = icmp sgt i64 %153, %10
  br i1 %170, label %171, label %152

; <label>:171:                                    ; preds = %152
  %172 = fdiv double %168, %48
  br i1 %9, label %236, label %173

; <label>:173:                                    ; preds = %171
  br i1 %42, label %224, label %174

; <label>:174:                                    ; preds = %173
  %175 = insertelement <2 x double> undef, double %172, i32 0
  %176 = shufflevector <2 x double> %175, <2 x double> undef, <2 x i32> zeroinitializer
  %177 = insertelement <2 x double> undef, double %172, i32 0
  %178 = shufflevector <2 x double> %177, <2 x double> undef, <2 x i32> zeroinitializer
  br label %179

; <label>:179:                                    ; preds = %179, %174
  %180 = phi i64 [ 0, %174 ], [ %220, %179 ]
  %181 = phi i64 [ %41, %174 ], [ %221, %179 ]
  %182 = or i64 %180, 1
  %183 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %182
  %184 = bitcast double* %183 to <2 x double>*
  %185 = load <2 x double>, <2 x double>* %184, align 8, !tbaa !2
  %186 = getelementptr double, double* %183, i64 2
  %187 = bitcast double* %186 to <2 x double>*
  %188 = load <2 x double>, <2 x double>* %187, align 8, !tbaa !2
  %189 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %182
  %190 = bitcast double* %189 to <2 x double>*
  %191 = load <2 x double>, <2 x double>* %190, align 8, !tbaa !2
  %192 = getelementptr double, double* %189, i64 2
  %193 = bitcast double* %192 to <2 x double>*
  %194 = load <2 x double>, <2 x double>* %193, align 8, !tbaa !2
  %195 = fmul <2 x double> %176, %191
  %196 = fmul <2 x double> %178, %194
  %197 = fadd <2 x double> %185, %195
  %198 = fadd <2 x double> %188, %196
  %199 = bitcast double* %189 to <2 x double>*
  store <2 x double> %197, <2 x double>* %199, align 8, !tbaa !2
  %200 = bitcast double* %192 to <2 x double>*
  store <2 x double> %198, <2 x double>* %200, align 8, !tbaa !2
  %201 = or i64 %180, 5
  %202 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %201
  %203 = bitcast double* %202 to <2 x double>*
  %204 = load <2 x double>, <2 x double>* %203, align 8, !tbaa !2
  %205 = getelementptr double, double* %202, i64 2
  %206 = bitcast double* %205 to <2 x double>*
  %207 = load <2 x double>, <2 x double>* %206, align 8, !tbaa !2
  %208 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %201
  %209 = bitcast double* %208 to <2 x double>*
  %210 = load <2 x double>, <2 x double>* %209, align 8, !tbaa !2
  %211 = getelementptr double, double* %208, i64 2
  %212 = bitcast double* %211 to <2 x double>*
  %213 = load <2 x double>, <2 x double>* %212, align 8, !tbaa !2
  %214 = fmul <2 x double> %176, %210
  %215 = fmul <2 x double> %178, %213
  %216 = fadd <2 x double> %204, %214
  %217 = fadd <2 x double> %207, %215
  %218 = bitcast double* %208 to <2 x double>*
  store <2 x double> %216, <2 x double>* %218, align 8, !tbaa !2
  %219 = bitcast double* %211 to <2 x double>*
  store <2 x double> %217, <2 x double>* %219, align 8, !tbaa !2
  %220 = add i64 %180, 8
  %221 = add i64 %181, -2
  %222 = icmp eq i64 %221, 0
  br i1 %222, label %223, label %179, !llvm.loop !22

; <label>:223:                                    ; preds = %179
  br i1 %45, label %236, label %224

; <label>:224:                                    ; preds = %223, %173
  %225 = phi i64 [ 1, %173 ], [ %44, %223 ]
  br label %226

; <label>:226:                                    ; preds = %224, %226
  %227 = phi i64 [ %234, %226 ], [ %225, %224 ]
  %228 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %227
  %229 = load double, double* %228, align 8, !tbaa !2
  %230 = getelementptr inbounds [14003 x double], [14003 x double]* @p, i64 0, i64 %227
  %231 = load double, double* %230, align 8, !tbaa !2
  %232 = fmul double %172, %231
  %233 = fadd double %229, %232
  store double %233, double* %230, align 8, !tbaa !2
  %234 = add nuw nsw i64 %227, 1
  %235 = icmp sgt i64 %227, %10
  br i1 %235, label %236, label %226, !llvm.loop !23

; <label>:236:                                    ; preds = %226, %223, %136, %149, %171
  %237 = phi double [ %168, %171 ], [ 0.000000e+00, %149 ], [ 0.000000e+00, %136 ], [ %168, %223 ], [ %168, %226 ]
  %238 = add nuw nsw i32 %47, 1
  %239 = icmp eq i32 %238, 26
  br i1 %239, label %240, label %46

; <label>:240:                                    ; preds = %236
  %241 = add i32 %29, 25
  store i32 %241, i32* @conj_grad.callcount, align 4, !tbaa !6
  br i1 %28, label %330, label %242

; <label>:242:                                    ; preds = %240
  %243 = load i32, i32* getelementptr inbounds ([14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 1), align 4, !tbaa !6
  br label %244

; <label>:244:                                    ; preds = %326, %242
  %245 = phi i32 [ %249, %326 ], [ %243, %242 ]
  %246 = phi i64 [ %247, %326 ], [ 1, %242 ]
  %247 = add nuw nsw i64 %246, 1
  %248 = getelementptr inbounds [14002 x i32], [14002 x i32]* @rowstr, i64 0, i64 %247
  %249 = load i32, i32* %248, align 4, !tbaa !6
  %250 = icmp slt i32 %245, %249
  br i1 %250, label %251, label %326

; <label>:251:                                    ; preds = %244
  %252 = sext i32 %245 to i64
  %253 = sext i32 %249 to i64
  %254 = sub nsw i64 %253, %252
  %255 = add nsw i64 %253, -1
  %256 = sub nsw i64 %255, %252
  %257 = and i64 %254, 3
  %258 = icmp eq i64 %257, 0
  br i1 %258, label %276, label %259

; <label>:259:                                    ; preds = %251
  br label %260

; <label>:260:                                    ; preds = %260, %259
  %261 = phi i64 [ %252, %259 ], [ %273, %260 ]
  %262 = phi double [ 0.000000e+00, %259 ], [ %272, %260 ]
  %263 = phi i64 [ %257, %259 ], [ %274, %260 ]
  %264 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %261
  %265 = load double, double* %264, align 8, !tbaa !2
  %266 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %261
  %267 = load i32, i32* %266, align 4, !tbaa !6
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %268
  %270 = load double, double* %269, align 8, !tbaa !2
  %271 = fmul double %265, %270
  %272 = fadd double %262, %271
  %273 = add nsw i64 %261, 1
  %274 = add i64 %263, -1
  %275 = icmp eq i64 %274, 0
  br i1 %275, label %276, label %260, !llvm.loop !24

; <label>:276:                                    ; preds = %260, %251
  %277 = phi i64 [ %252, %251 ], [ %273, %260 ]
  %278 = phi double [ 0.000000e+00, %251 ], [ %272, %260 ]
  %279 = phi double [ undef, %251 ], [ %272, %260 ]
  %280 = icmp ult i64 %256, 3
  br i1 %280, label %326, label %281

; <label>:281:                                    ; preds = %276
  br label %282

; <label>:282:                                    ; preds = %282, %281
  %283 = phi i64 [ %277, %281 ], [ %324, %282 ]
  %284 = phi double [ %278, %281 ], [ %323, %282 ]
  %285 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %283
  %286 = load double, double* %285, align 8, !tbaa !2
  %287 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %283
  %288 = load i32, i32* %287, align 4, !tbaa !6
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %289
  %291 = load double, double* %290, align 8, !tbaa !2
  %292 = fmul double %286, %291
  %293 = fadd double %284, %292
  %294 = add nsw i64 %283, 1
  %295 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %294
  %296 = load double, double* %295, align 8, !tbaa !2
  %297 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %294
  %298 = load i32, i32* %297, align 4, !tbaa !6
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %299
  %301 = load double, double* %300, align 8, !tbaa !2
  %302 = fmul double %296, %301
  %303 = fadd double %293, %302
  %304 = add nsw i64 %283, 2
  %305 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %304
  %306 = load double, double* %305, align 8, !tbaa !2
  %307 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %304
  %308 = load i32, i32* %307, align 4, !tbaa !6
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %309
  %311 = load double, double* %310, align 8, !tbaa !2
  %312 = fmul double %306, %311
  %313 = fadd double %303, %312
  %314 = add nsw i64 %283, 3
  %315 = getelementptr inbounds [2198001 x double], [2198001 x double]* @a, i64 0, i64 %314
  %316 = load double, double* %315, align 8, !tbaa !2
  %317 = getelementptr inbounds [2198001 x i32], [2198001 x i32]* @colidx, i64 0, i64 %314
  %318 = load i32, i32* %317, align 4, !tbaa !6
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds [14003 x double], [14003 x double]* @z, i64 0, i64 %319
  %321 = load double, double* %320, align 8, !tbaa !2
  %322 = fmul double %316, %321
  %323 = fadd double %313, %322
  %324 = add nsw i64 %283, 4
  %325 = icmp slt i64 %324, %253
  br i1 %325, label %282, label %326

; <label>:326:                                    ; preds = %276, %282, %244
  %327 = phi double [ 0.000000e+00, %244 ], [ %279, %276 ], [ %323, %282 ]
  %328 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %246
  store double %327, double* %328, align 8, !tbaa !2
  %329 = icmp slt i64 %246, %30
  br i1 %329, label %244, label %330

; <label>:330:                                    ; preds = %326, %240
  br i1 %9, label %344, label %331

; <label>:331:                                    ; preds = %330
  br label %332

; <label>:332:                                    ; preds = %331, %332
  %333 = phi i64 [ %342, %332 ], [ 1, %331 ]
  %334 = phi double [ %341, %332 ], [ 0.000000e+00, %331 ]
  %335 = getelementptr inbounds [14003 x double], [14003 x double]* @x, i64 0, i64 %333
  %336 = load double, double* %335, align 8, !tbaa !2
  %337 = getelementptr inbounds [14003 x double], [14003 x double]* @r, i64 0, i64 %333
  %338 = load double, double* %337, align 8, !tbaa !2
  %339 = fsub double %336, %338
  %340 = fmul double %339, %339
  %341 = fadd double %334, %340
  %342 = add nuw nsw i64 %333, 1
  %343 = icmp sgt i64 %333, %10
  br i1 %343, label %344, label %332

; <label>:344:                                    ; preds = %332, %330
  %345 = phi double [ 0.000000e+00, %330 ], [ %341, %332 ]
  %346 = tail call double @sqrt(double %345) #6
  store double %346, double* %0, align 8, !tbaa !2
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare void @timer_clear(i32) local_unnamed_addr #3

declare void @timer_start(i32) local_unnamed_addr #3

declare void @timer_stop(i32) local_unnamed_addr #3

declare double @timer_read(i32) local_unnamed_addr #3

; Function Attrs: nounwind readnone speculatable
declare double @llvm.fabs.f64(double) #4

declare void @c_print_results(i8*, i8 signext, i32, i32, i32, i32, i32, double, double, i8*, i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare double @pow(double, double) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.1 (tags/RELEASE_601/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = distinct !{!12, !13, !11}
!13 = !{!"llvm.loop.unroll.runtime.disable"}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !9}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !13, !11}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !13, !11}
!21 = distinct !{!21, !9}
!22 = distinct !{!22, !11}
!23 = distinct !{!23, !13, !11}
!24 = distinct !{!24, !9}

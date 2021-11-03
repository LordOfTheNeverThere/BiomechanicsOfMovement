function [mass, mInertia] = MassInertia()

global bodyLenghts;

BW = 55;

mHead = 0.081 * BW;
mForearm = 0.016 * BW;
mArm = 0.028 * BW;
mFoot = 0.0145 * BW;
mLeg = 0.0465 * BW;
mThigh = 0.1 * BW;
mTrunk = 0.497 * BW;
mToes = 0.006 * BW; %este valor não estava nas tabelas antropometricas, somei as fracoes anteriores todas e vi o que falava de BW

iHead = mHead * (( 0.495 * bodyLenghts(1))^2);
iLForearm = mForearm *((0.303 * bodyLenghts(2))^2);
iRForearm = mForearm *((0.303 * bodyLenghts(4))^2);
iLArm = mArm * ((0.322 * bodyLenghts(3))^2);
iRArm = mArm * ((0.322 * bodyLenghts(5))^2);
iLThigh = mThigh * ((0.323 * bodyLenghts(7))^2);
iRThigh = mThigh * ((0.323 * bodyLenghts(11))^2);
iLLeg = mLeg * ((0.302 * bodyLenghts(8))^2);
iRLeg = mLeg * ((0.302 * bodyLenghts(12))^2);
iLFoot = mFoot * ((0.475 * bodyLenghts(9))^2);
iRFoot = mFoot * ((0.475 * bodyLenghts(13))^2);

mass = [mHead, mForearm, mArm, mForearm, mArm, mTrunk, mThigh, mLeg, mFoot, mToes, mThigh, mLeg, mFoot, mToes,];

mInertia = [iHead, iLForearm, iLArm, iRForearm, iRArm, iLThigh, iLLeg, ...
    iLFoot, iRThigh, iRLeg, iRFoot];

% disp(mass);
% disp(mInertia);
% [mass, inertia] = MassInertia(1);
% disp("mass" + mass);
% disp("inertia" + inertia);

end 

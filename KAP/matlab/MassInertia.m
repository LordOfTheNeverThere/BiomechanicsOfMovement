function [mass, mInertia] = MassInertia(b)

global bodyLengths;

BW = 55;

mHead = 0.081 * BW;
mForearm = 0.016 * BW;
mArm = 0.028 * BW;
mFoot = 0.0145 * BW;
mLeg = 0.0465 * BW;
mThigh = 0.1 * BW;
mTrunk = 0.497 * BW;
mToes = 0.006 * BW; %este valor não estava nas tabelas antropometricas, somei as fracoes anteriores todas e vi o que falava de BW

iHead = mHead * (( 0.495 * bodyLengths(b))^2);
iLForearm = mForearm *((0.303 * bodyLengths(b))^2);
iRForearm = mForearm *((0.303 * bodyLengths(b))^2);
iLArm = mArm * ((0.322 * bodyLengths(b))^2);
iRArm = mArm * ((0.322 * bodyLengths(b))^2);
iLThigh = mThigh * ((0.323 * bodyLengths(b))^2);
iRThigh = mThigh * ((0.323 * bodyLengths(b))^2);
iLLeg = mLeg * ((0.302 * bodyLengths(b))^2);
iRLeg = mLeg * ((0.302 * bodyLengths(b))^2);
iLFoot = mFoot * ((0.475 * bodyLengths(b))^2);
iRFoot = mFoot * ((0.475 * bodyLengths(b))^2);

mass = [mHead, mForearm, mArm, mTrunk, mThigh, mLeg, mFoot, mToes];

mInertia = [iHead, iLForearm, iLArm, iRForearm, iRArm, iTrunk, iLThigh, iLLeg, ...
    iLFoot, iRThigh, iRLeg, iRFoot];

end 
